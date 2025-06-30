library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU_on_board is Port (
    clk : in std_logic;
    read : in std_logic;
    reset : in std_logic;
    led : out std_logic_vector(3 downto 0));
end CU_on_board;

architecture Behavioral of CU_on_board is
    
    component CU is port (
          start : in std_logic;
          reset: in std_logic;
          clk : in std_logic;
          output : out std_logic_vector(3 downto 0)
          );
    end component;

    signal counter : integer := 0;
    signal clock : std_logic := '0'; -- mezzo secondo
    signal out_put : std_logic_vector(3 downto 0):=(others=>'0');
     
begin

    c_u : CU port map(
        start => read,
        reset => reset,
        clk => clock,
        output => out_put);
        
    led <= out_put;
    
    process(clk)
    begin
        if rising_edge(clk) then
            counter <= counter + 1;
            if counter = (50_000_000)/2 then
                counter <= 0;
                clock <= not clock;
            end if;
        end if;
    end process;
    
end Behavioral;
