library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is port(
        address : in  std_logic_vector(3 downto 0);
        d_out    : out std_logic_vector(7 downto 0)
    );
end entity ROM;

architecture RTL of ROM is
    type MEMORY_16_8 is array (0 to 15) of std_logic_vector(7 downto 0);

    constant ROM_16_8 : MEMORY_16_8 := (
        "00000000",
        "00000001",
        "00000010",
        "00000011",
        "00000100",
        "00000101",
        "00000110",
        "00000111",
        "00001000",
        "00001001",
        "00001010",
        "00001011",
        "00001100",
        "00001101",
        "00001110",
        "00001111"
    );

begin
    main : process(address)
    begin
        d_out <= ROM_16_8(to_integer(unsigned(address)));
    end process main;
end architecture RTL;
