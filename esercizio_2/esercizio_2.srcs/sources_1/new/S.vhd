library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity S is port(
        address : in  std_logic_vector(3 downto 0);
        result : out std_logic_vector(3 downto 0)
    );
end entity S;

architecture S_a of S is
    signal rom_out  : std_logic_vector(7 downto 0);
    signal m_out : std_logic_vector(3 downto 0);
	
begin
    memory_rom : entity work.ROM port map(
            address => address,
            d_out => rom_out
        );

    machine_m : entity work.M port map(
            x  => rom_out,
            y => m_out
        );

    result <= m_out;
end architecture S_a;