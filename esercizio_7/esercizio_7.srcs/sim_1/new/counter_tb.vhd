library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_tb is
end counter_tb;

architecture testbench of counter_tb is
    signal clock, reset, enable: std_logic := '0';
    signal count: std_logic_vector(3 downto 0);

    constant CLOCK_PERIOD: time := 10 ns;

begin
    uut : entity work.counter
        port map(
            clock => clock,
            reset => reset,
            enable => enable,
            count => count
        );

    clk: process
    begin
        while now < 1000 ns loop
            clock <= '0';
            wait for CLOCK_PERIOD / 2;
            clock <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    stim: process
    begin
        reset <= '1';
        enable <= '0';
        wait for 20 ns;

        reset <= '0';
        enable <= '1';
        wait for 200 ns;

        enable <= '0';
        wait for 100 ns;

        enable <= '1';
        wait for 200 ns;

        enable <= '0';
        wait for 100 ns;
        reset <= '1';

        wait;
    end process;

end testbench;
