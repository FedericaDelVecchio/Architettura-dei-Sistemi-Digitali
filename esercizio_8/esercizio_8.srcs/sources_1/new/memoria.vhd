library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity memoria is
    Port ( 
        reset : in STD_LOGIC;
        clock : in STD_LOGIC;
        address : in STD_LOGIC_VECTOR (3 downto 0);
        data_in : in STD_LOGIC_VECTOR (3 downto 0);
        write : in STD_LOGIC;
        load : in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end memoria;

architecture Behavioral of memoria is
    type memory_array is array (0 to 15) of STD_LOGIC_VECTOR (3 downto 0);
    signal memory : memory_array := (
        0 => "0000", 1 => "0001", 2 => "0010", 3 => "0011",
        4 => "0100", 5 => "0101", 6 => "0110", 7 => "0111",
        8 => "1000", 9 => "1001", 10 => "1010", 11 => "1011",
        12 => "1100", 13 => "1101", 14 => "1110", 15 => "1111"
    );
    
begin
    process(clock, reset)
    begin
        if reset='1' then
            data_out <= (others=>'0');
        elsif (clock'event and clock='1') then
            if write = '1' then
                memory(to_integer(unsigned(address))) <= data_in;
            elsif load = '1' then
                data_out <= memory(to_integer(unsigned(address)));
            end if;
        end if;
    end process;
end Behavioral;
