library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1_2_tb is
end demux_1_2_tb;

architecture testbench of demux_1_2_tb is
    signal d_in, d_out_1, d_out_2: std_logic_vector(1 downto 0);
    signal sel: std_logic := '0';

begin
    uut : entity work.demux_1_2
        port map(
            d_in => d_in,
            sel => sel,
            d_out_1 => d_out_1,
            d_out_2 => d_out_2
        );

    stim: process
    begin
        d_in <= "00";
        sel <= '0';
        wait for 20 ns;
        assert d_out_1 = "00" report "Error for sel = '0'" severity error;
        assert d_out_2 = "--" report "Error for sel = '0'" severity error;

        d_in <= "11";
        sel <= '1';
        wait for 20 ns;
        assert d_out_1 = "--" report "Error for sel = '1'" severity error;
        assert d_out_2 = "11" report "Error for sel = '1'" severity error;

        d_in <= "10";
        sel <= '0';
        wait for 20 ns;
        assert d_out_1 = "10" report "Error for sel = '0'" severity error;
        assert d_out_2 = "--" report "Error for sel = '0'" severity error;

        d_in <= "01";
        sel <= '1';
        wait for 20 ns;
        assert d_out_1 = "--" report "Error for sel = '1'" severity error;
        assert d_out_2 = "01" report "Error for sel = '1'" severity error;

        wait;
    end process;

end testbench;
