library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity M_tb is
end M_tb;

architecture testbench of M_tb is
    signal Y_in, Y_out: std_logic_vector(7 downto 0) :=(others=>'0');
    signal clk, rst, load: std_logic := '0';

    constant CLOCK_PERIOD: time := 10 ns;

begin
    dut : entity work.M
        port map(
            Y_in => Y_in,
            clk => clk,
            rst => rst,
            load => load,
            Y_out => Y_out
        );

    process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for CLOCK_PERIOD / 2;
            clk <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    process
    begin
        rst <= '1';
        wait for 20 ns;

        rst <= '0';
        load <= '1';
        Y_in <= "01010101";
        wait for 20 ns;

        load <= '0';
        wait for 200 ns;

        load <= '1';
        Y_in <= "11001100";
        wait for 20 ns;

        load <= '0';
        wait for 60 ns;
        
        Y_in <= "11001111";
        wait for 150 ns;

        rst <= '1';
        wait for 20 ns;

        rst <= '0';
        load <= '1';
        Y_in <= "11111111"; 
        wait for 20 ns;

        load <= '0';
        wait for 200 ns;

        rst <= '1';
        wait for 20 ns;

        rst <= '0';
        load <= '1';
        Y_in <= "00000000";
        wait for 20 ns;

        load <= '0';
        wait for 200 ns;

        wait;
    end process;

end testbench;
