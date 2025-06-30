library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity cronometro_on_board is
port (
    CLK : in std_logic;
    stop : in std_logic; -- pulsante per catturare gli intertempi
    view : in std_logic; -- pulsante per visualizzare gli intertempi
    input : in std_logic_vector(5 downto 0);
    input_sec : in std_logic;
    input_min : in std_logic;
    input_ore : in std_logic;
    anodes_out : out  STD_LOGIC_VECTOR (7 downto 0);
    cathodes_out : out  STD_LOGIC_VECTOR (7 downto 0);
    input_count : in std_logic;
    reset : in std_logic
);
end cronometro_on_board;

architecture Behavioral of cronometro_on_board is

    component display_seven_segments
	generic(
		CLKIN_freq : integer := 100000000;
		CLKOUT_freq : integer := 500 
				);
	port(
		CLK : IN std_logic;
		RST : IN std_logic;
		VALUE : IN std_logic_vector(16 downto 0);
		ENABLE : IN std_logic_vector(7 downto 0);
		DOTS : IN std_logic_vector(7 downto 0);     
		ANODES : OUT std_logic_vector(7 downto 0);
		CATHODES : OUT std_logic_vector(7 downto 0)
		);
    end component;
    
    component cronometro is
    port (
        clk : in std_logic;
        reset : in std_logic;
        set : in std_logic;
        init_sec : in integer range 0 to 59;
        init_min : in integer range 0 to 59;
        init_ore : in integer range 0 to 23;
        sec : out integer range 0 to 59;
        min : out integer range 0 to 59;
        ore : out integer range 0 to 23
    );
    end component;
    
    component counter_mod8 is
    port (
        clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
		   enable : in STD_LOGIC;
           counter : out  STD_LOGIC_VECTOR (2 downto 0)
    );
    end component;
    
    component MEM is
    port (
        clk     : in  std_logic;
        address : in  std_logic_vector(2 downto 0);
        d_in    : in  std_logic_vector(16 downto 0);
        read_write   : in  std_logic; -- se è basso di legge, se è alto si scrive
        d_out   : out std_logic_vector(16 downto 0)
    );
    end component;
    
     signal value : std_logic_vector(16 downto 0); -- ingresso a display_seven_segments
     signal tempo : std_logic_vector(16 downto 0); -- uscita di cronometro
     signal sec, min, ore : integer := 0;
     signal sec_init, min_init, ore_init: integer := 0;
     signal counter : integer := 0;
     signal clock : std_logic := '0';
     signal address_0, address_1, address : std_logic_vector(2 downto 0);
     signal intertempo : std_logic_vector(16 downto 0);
     signal stop_view : std_logic;
     signal r_w : std_logic; -- read o write?
     
begin
        
    new_clk : process(CLK) -- realizza un clock con periodo di 1 sec a partire da CLK
    begin
        if rising_edge(CLK) then
            counter <= counter + 1;
            if counter = (100_000_000)/2 then
                counter <= 0;
                clock <= not clock;
            end if;
        end if;
    end process;
    
    tempo <= std_logic_vector(to_unsigned(ore,5)) & std_logic_vector(to_unsigned(min,6))  & std_logic_vector(to_unsigned(sec,6));
     
    cronom : cronometro port map (
        clk => clock,
        reset => reset,
        set => input_count,
        init_sec => sec_init,
        init_min => min_init,
        init_ore => ore_init,
        sec => sec,
        min => min,
        ore => ore );
        
     init_counter : process(CLK) -- per settare il conteggio iniziale
     begin
        if(input_sec='1' and input_min='0' and input_ore='0') then
            sec_init <= to_integer(unsigned(input));
        elsif(input_sec='0' and input_min='1' and input_ore='0') then
            min_init <= to_integer(unsigned(input));
        elsif(input_sec='0' and input_min='0' and input_ore='1') then
            ore_init <= to_integer(unsigned(input(4 downto 0)));
        end if;
     end process;
     
     counter_addr_0 : counter_mod8 port map ( -- per ricavare l'indirizzo nel quale scrivere il prossimo intertempo nella memoria
        clock => stop,
        reset => reset,
		enable => '1',
        counter => address_0
     );
     
     counter_addr_1 : counter_mod8 port map ( -- per ricavare l'indirizzo da cui leggere un successivo intertempo, in precedenza scritto nella memoria
        clock => view,
        reset => reset,
		enable => '1',
        counter => address_1
     );
     
     stop_view <= stop or view;
    
     address <= address_1 when view='1' else address_0; 

     gestione_intertempi : process(address)
     begin
        if view='1' then
            r_w <= '0';
            value <= intertempo;
        else
            r_w <= '1';
            value <= tempo;
        end if;
     end process;
     
     intertempi_mem : MEM port map ( -- memoria che contiene gli intertempi
        clk => stop_view,
        address => address,
        read_write => r_w,
        d_in => tempo,
        d_out   => intertempo
     );
     
     seven_segment_array: display_seven_segments 
     generic map(
        CLKIN_freq => 100000000,
        CLKOUT_freq => 500 )
     port map(
        CLK => CLK,
        RST => reset,
        value => value,
        enable => "00111111",
        dots => "00010100",  
        anodes => anodes_out,
        cathodes => cathodes_out
     );

end Behavioral;
