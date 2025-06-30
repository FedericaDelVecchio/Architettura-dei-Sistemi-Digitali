library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
    port (
        clk     : in  std_logic;
        read    : in  std_logic;
        address : in  std_logic_vector(3 downto 0);
        d_out   : out std_logic_vector(7 downto 0)
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

    signal data : std_logic_vector(7 downto 0) := (others => '0');

begin
    process (clk)
    begin
        if rising_edge(clk) then
            if read='1' then
                data <= ROM_16_8(to_integer(unsigned(address)));
            end if;
        end if;
    end process;

    d_out <= data;

end architecture RTL;
