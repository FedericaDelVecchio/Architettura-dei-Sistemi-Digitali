library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contatore is
    generic (
        MAX_VALUE : integer := 59
    );
    port (
        clk : in std_logic;
        reset : in std_logic;
        set : in std_logic;
        init_count : in integer range 0 to MAX_VALUE;
        count : out integer range 0 to MAX_VALUE
    );
end entity;

architecture Behavioral of contatore is

    signal counter : integer range 0 to MAX_VALUE :=0;
    
begin

    process(clk, reset, set)
    begin
        if reset = '1' then
                counter <= 0;
        elsif set='1' then
                counter <= init_count;
        elsif rising_edge(clk) then
            if counter < MAX_VALUE then
                counter <= counter + 1;
            else
                counter <= 0;
            end if;
        end if;
    end process;
    
    count <= counter;
    
end architecture;
