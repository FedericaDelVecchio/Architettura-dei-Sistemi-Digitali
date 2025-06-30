
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity total_system_tb is
end total_system_tb;

architecture Behavioral of total_system_tb is
    component node_A is
   Port (  clock : in STD_LOGIC;
           start : in STD_LOGIC;
           reset : in STD_LOGIC;
           ack : in std_logic;
           req : out std_logic;
           data1 : out std_logic_vector(3 downto 0);
           data2 : out std_logic_vector(3 downto 0) );
    end component;
    
    component node_B is
      Port (
        clock : in std_logic;
        reset : in std_logic;
        req : in std_logic;
        ack : out std_logic;
        data1 : in std_logic_vector(3 downto 0);
        data2 : in std_logic_vector(3 downto 0));
    end component;
    
    signal clk1, clk2, start, rst, ack, req : std_logic := '0';
    signal data1, data2 : std_logic_vector(3 downto 0) := (others=>'0');
begin
    n_A : node_A port map (
        clock => clk2,
        start => start,
        reset => rst,
        ack => ack,
        req => req,
        data1 => data1,
        data2 => data2
    );
    
    n_B : node_B port map (
        clock => clk1,
        reset => rst,
        ack => ack,
        req => req,
        data1 => data1,
        data2 => data2
    );
    
    clock_gen1: process
    begin
        wait for 2 ns;
        clk1 <= not clk1;
    end process;
    
     clock_gen2: process
    begin
        wait for 5 ns;
        clk2 <= not clk2;
    end process;
    
    process
    begin
        wait for 1 ns;
        start<='1';
        wait for 6 ns;
        start<='0';
        wait for 900 ns;
        wait;
    end process;

end Behavioral;
