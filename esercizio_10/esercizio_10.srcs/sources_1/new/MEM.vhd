library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MEM is
    Port ( 
        address : in STD_LOGIC_VECTOR(3 downto 0);
        data_in : in STD_LOGIC_VECTOR(7 downto 0);
        write : in STD_LOGIC;
        read : in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end MEM;

architecture Behavioral of MEM is

    type Memory_Array is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
    signal mem : Memory_Array := (others => "00000000");
    
begin
    
    process(address, data_in, write, read)
    begin
        if write = '1' then
            mem(conv_integer(address)) <= data_in;
        elsif read = '1' then
            data_out <= mem(conv_integer(address));
        else
            data_out <= (others => '0');
        end if;
    end process;
end Behavioral;
