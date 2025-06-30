library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sistema_totale is
    Port (en0, en1, en2, en3 : in std_logic;
        in0, in1, in2, in3 : in std_logic_vector(5 downto 0);
        out0, out1, out2, out3 : out std_logic_vector(1 downto 0));
end sistema_totale;

architecture Behavioral of sistema_totale is
    component rete_di_interconnesione is
    Port (S_1, S_2, S_3, S_4 : in std_logic_vector(1 downto 0);
        D_1, D_2, D_3, D_4 : out std_logic_vector(1 downto 0);
        sorgente : in std_logic_vector(1 downto 0);
        destinazione : in std_logic_vector(1 downto 0));
    end component;
    
    component gestione_priorita is
    Port (A_1, A_2, A_3, A_4 : in std_logic_vector(5 downto 0);
    en_1, en_2, en_3, en_4 : in std_logic;
    s, d : out std_logic_vector(1 downto 0);
    B_1, B_2, B_3, B_4 : out std_logic_vector(1 downto 0));
    end component;
    
    signal temp1, temp2, temp3, temp4 : std_logic_vector(1 downto 0);
    signal source, destination : std_logic_vector(1 downto 0);
begin
    g_p : gestione_priorita port map (
        A_1 => in0,
        A_2 => in1,
        A_3 => in2,
        A_4 => in3,
        en_1 => en0,
        en_2 => en1,
        en_3 => en2,
        en_4 => en3,
        s => source,
        d => destination,
        B_1 => temp1,
        B_2 => temp2,
        B_3 => temp3,
        B_4 => temp4);

    r_d_i : rete_di_interconnesione port map (
        S_1 => temp1,
        S_2 => temp2,
        S_3 => temp3,
        S_4 => temp4,
        sorgente => source,
        destinazione => destination,
        D_1 => out0,
        D_2 => out1,
        D_3 => out2,
        D_4 => out3
    );
end Behavioral;
