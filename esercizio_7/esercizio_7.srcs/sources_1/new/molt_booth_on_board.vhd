library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity molt_booth_on_board is
    Port (clk : in std_logic;
        reset : in std_logic; -- da premere prima di calcolare il prossimo prodotto
        start : in std_logic;
        insert : in std_logic;
        X : in std_logic_vector(7 downto 0);
        Y : in std_logic_vector(7 downto 0); 
        anodes_out : out  std_logic_vector (7 downto 0);
		cathodes_out : out  std_logic_vector (7 downto 0)
        );
        
end molt_booth_on_board;

architecture Behavioral of molt_booth_on_board is
    component molt_booth is
	 port( clock, reset, start: in std_logic;
		   X, Y: in std_logic_vector(7 downto 0);		  
		   P: out std_logic_vector(15 downto 0);
		   stop_cu: out std_logic);
    end component;
    
    component ButtonDebouncer is
    generic (                       
        CLK_period: integer := 10; 
        btn_noise_time: integer := 10000000 
    );
    Port ( RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           BTN : in STD_LOGIC;
           CLEARED_BTN : out STD_LOGIC);
    end component;
    
    component display_seven_segments
	generic(
		CLKIN_freq : integer := 100000000; 
		CLKOUT_freq : integer := 500  
		                             
				);
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		VALUE : IN std_logic_vector(31 downto 0);
		ENABLE : IN std_logic_vector(7 downto 0);
		DOTS : IN std_logic_vector(7 downto 0);      
		ANODES : OUT std_logic_vector(7 downto 0);
		CATHODES : OUT std_logic_vector(7 downto 0)
		);
    end component;
    
    signal x_in, y_in : std_logic_vector(7 downto 0);
    signal value : std_logic_vector(31 downto 0);
    signal P : std_logic_vector(15 downto 0);
    signal stop_cu : std_logic;
    signal start_debounced : std_logic;
begin
    process(clk)
    begin
        if(insert='1') then
            x_in <= X;
            y_in <= Y;
        end if;    
    end process;
    
    debouncer : ButtonDebouncer generic map (CLK_period => 10, btn_noise_time => 10000000) port map (RST => reset, CLK => clk, BTN => start, CLEARED_BTN => start_debounced);
    
    molticatore_booth : molt_booth port map(clock => clk, reset => reset, start => start_debounced, X => x_in, Y => y_in, P => P, stop_cu => stop_cu);
    
    process(clk)
    begin
        if(reset='1') then
           value <= (others=>'0');
        elsif(stop_cu='1') then
           value <= "0000000000000000" & P;
        end if;
    end process;
    
    seven_segment_array: display_seven_segments GENERIC MAP(
	CLKIN_freq => 100000000,
	CLKOUT_freq => 500 
	)
	PORT MAP(
		CLK => clk,
		RST => reset,
		value => value,
		enable => "00001111", 
		dots => "00000000", 
		anodes => anodes_out,
		cathodes => cathodes_out
    );

    
end Behavioral;
