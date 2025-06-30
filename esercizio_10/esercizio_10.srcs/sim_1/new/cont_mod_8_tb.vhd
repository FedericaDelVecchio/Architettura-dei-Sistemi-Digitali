library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cont_mod_8_tb is
end cont_mod_8_tb;

architecture testbench of cont_mod_8_tb is
    signal clock, reset : std_logic := '0';
    signal count : std_logic_vector(3 downto 0);

    constant CLOCK_PERIOD: time := 10 ns; 
begin
    uut : entity work.cont_mod_8
        generic map(
            MAX_VALUE => 7 
        )
        port map(
            clock => clock,
            reset => reset,
            count => count
        );

    process
    begin
        while now < 2000 ns loop
            clock <= '0';
            wait for CLOCK_PERIOD / 2;
            clock <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    process
    begin
        reset <= '1';
        wait for 20 ns;

        reset <= '0';
        wait for 100 ns;

        reset <= '1';
        wait;
    end process;

end testbench;
