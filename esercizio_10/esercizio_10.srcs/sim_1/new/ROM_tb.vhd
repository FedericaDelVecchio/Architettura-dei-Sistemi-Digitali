library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_tb is
end ROM_tb;

architecture testbench of ROM_tb is
    signal address: std_logic_vector(3 downto 0);
    signal d_out: std_logic_vector(7 downto 0);

begin
    uut : entity work.ROM
        port map(
            address => address,
            d_out => d_out
        );

    process
    begin
        for i in 0 to 15 loop
            address <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
            assert d_out = std_logic_vector(to_unsigned(i, d_out'length)) report "Error" severity error;
        end loop;

        wait;
    end process;

end testbench;
