library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sistema_complessivo is
    Port (
    clock, start, reset : in std_logic
     );
end sistema_complessivo;

architecture Behavioral of sistema_complessivo is
    component sistema_A is
    Port (clock, start, reset: in std_logic;
        interconnessione : out std_logic
     );
    end component;
    
    component sistema_B is
    Port (clock, reset, interconnessione : in std_logic );
    end component;
    
    signal interconnessione : STD_LOGIC;
begin
    sis_A : sistema_A port map (clock => clock, start => start, reset => reset, interconnessione => interconnessione);
    
    sis_B : sistema_B port map (clock => clock, reset => reset, interconnessione => interconnessione);
end Behavioral;
