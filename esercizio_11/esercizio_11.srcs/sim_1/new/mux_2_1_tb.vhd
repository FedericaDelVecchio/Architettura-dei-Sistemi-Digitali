library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_1_tb is
end mux_2_1_tb;

architecture testbench of mux_2_1_tb is
    signal d_in_1, d_in_2, d_out: std_logic_vector(1 downto 0);
    signal sel: std_logic := '0';

begin
    dut : entity work.mux_2_1
        port map(
            d_in_1 => d_in_1,
            d_in_2 => d_in_2,
            sel => sel,
            d_out => d_out
        );

    process
    begin
        d_in_1 <= "00";
        d_in_2 <= "11";
        sel <= '0';
        wait for 20 ns;
        assert d_out = "00" report "Error for sel = '0'" severity error;

        d_in_1 <= "01";
        d_in_2 <= "10";
        sel <= '1';
        wait for 20 ns;
        assert d_out = "10" report "Error for sel = '1'" severity error;

        d_in_1 <= "10";
        d_in_2 <= "01";
        sel <= '0';
        wait for 20 ns;
        assert d_out = "10" report "Error for sel = '0'" severity error;

        d_in_1 <= "00";
        d_in_2 <= "11";
        sel <= '1';
        wait for 20 ns;
        assert d_out = "11" report "Error for sel = '1'" severity error;

        wait;
    end process;

end testbench;
