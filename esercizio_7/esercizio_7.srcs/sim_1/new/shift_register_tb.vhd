library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shift_register_tb is
end shift_register_tb;

architecture testbench of shift_register_tb is
    signal parallel_in, parallel_out: std_logic_vector(16 downto 0) := (others=>'0');
    signal clock, reset, load, shift: std_logic := '0';

    constant CLOCK_PERIOD: time := 10 ns;
begin
    uut : entity work.shift_register
        port map(
            parallel_in => parallel_in,
            clock => clock,
            reset => reset,
            load => load,
            shift => shift,
            parallel_out => parallel_out
        );

    process
    begin
        while now < 1000 ns loop
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
        load <= '1';
        parallel_in <= "01010101010101010";
        wait for 20 ns;

        load <= '0';
        shift <= '1';
        wait for 20 ns;

        shift <= '0';
        wait for 30 ns;
        
        shift <= '1';
        wait for 20 ns;

        shift <= '0';
        wait for 20 ns;
        
        shift <= '1';
        wait for 20 ns;

        shift <= '0';
        wait for 200 ns;

        load <= '1';
        parallel_in <= "11001100110011001"; 
        wait for 20 ns;

        load <= '0';
        shift <= '1';
        wait for 200 ns;
        wait;
    end process;

end testbench;
