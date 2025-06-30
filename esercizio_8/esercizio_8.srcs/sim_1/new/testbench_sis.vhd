library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testbench_sis is
end testbench_sis;

architecture Behavioral of testbench_sis is
    component sistema is
    Port (
        start, reset, clock : in std_logic );
    end component;
    
    signal clk, rst,start : std_logic  := '0';
begin

    clock_gen: process
    begin
        wait for 2 ns;
        clk <= not clk;
    end process;
    
    sis : sistema port map (start=>start,reset=>rst,clock=>clk);
    
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
