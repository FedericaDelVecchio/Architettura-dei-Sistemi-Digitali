library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rete_di_interconnesione is -- omega network
    Port (S_1, S_2, S_3, S_4 : in std_logic_vector(1 downto 0);
        D_1, D_2, D_3, D_4 : out std_logic_vector(1 downto 0);
        sorgente : in std_logic_vector(1 downto 0);
        destinazione : in std_logic_vector(1 downto 0));
end rete_di_interconnesione;

architecture Behavioral of rete_di_interconnesione is
    component switch_elem is
    Port (X_1, X_2 : in std_logic_vector(1 downto 0);
        src, dest : in std_logic;
        Y_1, Y_2 : out std_logic_vector(1 downto 0));
    end component;
    
    signal temp_1, temp_2, temp_3, temp_4 : std_logic_vector(1 downto 0);
begin
    switch_1 : switch_elem port map (
        X_1 => S_1,
        X_2 => S_2,
        src => sorgente(0),
        dest => destinazione(1),
        Y_1 => temp_1,
        Y_2 => temp_2
    );
    
    switch_2 : switch_elem port map (
        X_1 => S_3,
        X_2 => S_4,
        src => sorgente(0),
        dest => destinazione(1),
        Y_1 => temp_3,
        Y_2 => temp_4
    );
    
    switch_3 : switch_elem port map (
        X_1 => temp_1,
        X_2 => temp_3,
        src => sorgente(1),
        dest => destinazione(0),
        Y_1 => D_1,
        Y_2 => D_2
    );
    
    switch_4 : switch_elem port map (
        X_1 => temp_2,
        X_2 => temp_4,
        src => sorgente(1),
        dest => destinazione(0),
        Y_1 => D_3,
        Y_2 => D_4
    );

end Behavioral;
