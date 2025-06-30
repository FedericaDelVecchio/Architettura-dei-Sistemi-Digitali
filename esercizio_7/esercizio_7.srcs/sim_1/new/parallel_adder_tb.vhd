library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity parallel_adder_tb is
end parallel_adder_tb;

architecture testbench of parallel_adder_tb is
    signal X, Y, Z: std_logic_vector(7 downto 0);
    signal cin, cout: std_logic := '0';

    constant CLOCK_PERIOD: time := 10 ns;

begin
    -- Instance of the parallel_adder module
    uut_parallel_adder : entity work.parallel_adder
        port map(
            X => X,
            Y => Y,
            cin => cin,
            Z => Z,
            cout => cout
        );

    process
    begin
        X <= "00001001";
        Y <= "00001100";
        cin <= '0';
        wait for 20 ns;

        X <= "11111001";
        Y <= "11110011";
        cin <= '0';
        wait for 20 ns;

        X <= "00001001";
        Y <= "00001100";
        cin <= '1';
        wait for 20 ns;

        X <= "00001001";
        Y <= "00001100";
        cin <= '1';
        wait for 20 ns;

        X <= "11111001";
        Y <= "11110011";
        cin <= '1';
        wait for 20 ns;

        wait;
    end process;

end testbench;
