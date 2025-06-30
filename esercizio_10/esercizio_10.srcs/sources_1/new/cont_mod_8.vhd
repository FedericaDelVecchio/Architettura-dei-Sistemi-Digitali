library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cont_mod_8 is
    generic (
        MAX_VALUE : integer := 7
    );
    port (
        clock : in std_logic;
        reset : in std_logic;
        count : out std_logic_vector(3 downto 0) -- std_logic_vector di 4 bit
    );
end entity cont_mod_8;

architecture Behavioral of cont_mod_8 is
    signal counter : integer range 0 to MAX_VALUE := 0;
begin
    process(clock, reset)
    begin
        if reset = '1' then
            counter <= 0;
        elsif rising_edge(clock) then
            if counter < MAX_VALUE then
                counter <= counter + 1;
            else
                counter <= 0;
            end if;
        end if;
    end process;

    count <= std_logic_vector(to_unsigned(counter, count'length));
end architecture Behavioral;
