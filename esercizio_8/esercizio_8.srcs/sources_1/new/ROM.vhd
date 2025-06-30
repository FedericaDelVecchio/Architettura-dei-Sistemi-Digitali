library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ROM is port ( 
    clock : in STD_LOGIC;
    read : in STD_LOGIC;
    reset : in STD_LOGIC;
    address : in STD_LOGIC_VECTOR(3 downto 0);
    data : out STD_LOGIC_VECTOR(3 downto 0));
end ROM;

architecture Behavioral of ROM is
    type memory_array is array (0 to 15) of STD_LOGIC_VECTOR(3 downto 0);
    constant rom_data : memory_array := (
        0 => "0000", 1 => "0001", 2 => "0010", 3 => "0011",
        4 => "0100", 5 => "0101", 6 => "0110", 7 => "0111",
        8 => "1000", 9 => "1001", 10 => "1010", 11 => "1011",
        12 => "1100", 13 => "1101", 14 => "1110", 15 => "1111"
    );
begin
    process(clock)
    begin
        if reset='1' then
            data <= (others=>'0');
        elsif(rising_edge(clock) and read='1') then
            data <= rom_data(to_integer(unsigned(address)));
        end if;
    end process;
end Behavioral;