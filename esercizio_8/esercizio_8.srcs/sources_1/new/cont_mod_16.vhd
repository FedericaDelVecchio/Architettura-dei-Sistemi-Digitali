library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cont_mod_16 is
    generic (
        MAX_VALUE : integer := 15
    );
    port (
        clock : in std_logic;
        reset : in std_logic;
        count : out integer range 0 to MAX_VALUE
    );
end entity;

architecture Behavioral of cont_mod_16 is

    signal counter : integer range 0 to MAX_VALUE :=0;
    
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
    
    count <= counter;
    
end architecture;
