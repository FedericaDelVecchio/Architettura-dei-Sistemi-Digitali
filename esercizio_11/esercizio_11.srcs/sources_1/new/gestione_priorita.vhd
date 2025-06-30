library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gestione_priorita is
    Port (A_1, A_2, A_3, A_4 : in std_logic_vector(5 downto 0); -- i primi due bit determinano la sorgente, successivi due la destinazione, gli ultimi due i dati da trasmettere
    en_1, en_2, en_3, en_4 : in std_logic;
    s, d : out std_logic_vector(1 downto 0);
    B_1, B_2, B_3, B_4 : out std_logic_vector(1 downto 0));
end gestione_priorita;

architecture Behavioral of gestione_priorita is
    
    signal k : std_logic_vector(1 downto 0); -- priorità
    signal temp : std_logic_vector(1 downto 0);
    
begin
    k <= "00" when en_1='1' else
        "01" when en_2='1' else
        "10" when en_3='1' else
        "11" when en_4='1' else
        "--";
        
    s <= A_1 (5 downto 4) when k ="00" else
        A_2 (5 downto 4) when k ="01" else
        A_3 (5 downto 4) when k ="10" else
        A_4 (5 downto 4) when k ="11" else
        "--";
                
    d <= A_1 (3 downto 2) when k ="00" else
        A_2 (3 downto 2) when k ="01" else
        A_3 (3 downto 2) when k ="10" else
        A_4 (3 downto 2) when k ="11" else
        "--"; 

    temp <= A_1(1 downto 0) when k="00" else
         A_2(1 downto 0) when k="01" else
         A_3(1 downto 0) when k="10" else
         A_4(1 downto 0) when k="11" else
         "--"; 
         
    B_1 <= temp when k = "00" else "--";
    B_2 <= temp when k = "01" else "--";
    B_3 <= temp when k = "10" else "--";
    B_4 <= temp when k = "11" else "--";
end Behavioral;
