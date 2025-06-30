library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity operando_x is
    Port (
        clock : in std_logic;
        reset : in std_logic;
        dato_in : in std_logic_vector(3 downto 0);
        dato_out : out std_logic_vector(3 downto 0)
    );
end operando_x;

architecture Behavioral of operando_x is

    signal op_x : std_logic_vector(3 downto 0) := (others => '0');
    
begin
    process(clock, reset)
    begin
        if reset = '1' then
            op_x <= (others => '0');
        elsif (clock'event and clock='1') then
            op_x <= dato_in;
        end if;
    end process;

    dato_out <= op_x;
end Behavioral;
