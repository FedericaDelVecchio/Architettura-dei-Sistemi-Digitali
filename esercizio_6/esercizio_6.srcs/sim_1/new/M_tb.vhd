library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity M_tb is
end M_tb;

architecture testbench of M_tb is
    signal x_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal y_tb : STD_LOGIC_VECTOR(3 downto 0);

    component M
        port (
            x : in  STD_LOGIC_VECTOR(7 downto 0);
            y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

begin
    uut : M
        port map (
            x => x_tb,
            y => y_tb
        );

    stimulus : process
    begin
        wait for 10 ns;

        x_tb <= "00000000";
        wait for 10 ns;

        x_tb <= "11110000";
        wait for 10 ns;

        x_tb <= "01010101";
        wait for 10 ns;

        x_tb <= "11001100";
        wait for 10 ns;

        wait;
    end process stimulus;
end testbench;