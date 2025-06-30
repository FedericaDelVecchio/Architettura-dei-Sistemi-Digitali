library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity riconoscitore_board is
    Port (
        S1, S2, B1, B2 : in STD_LOGIC;
        RST, CLK : in STD_LOGIC;
        LED : out STD_LOGIC
    );
end riconoscitore_board;

architecture Behavioral of riconoscitore_board is
    signal i, M : STD_LOGIC := '0';
    signal Y : STD_LOGIC := '0';

    COMPONENT riconoscitore
        Port (
            i : in STD_LOGIC;
            RST, CLK : in STD_LOGIC;
            M : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end COMPONENT;

begin
    riconoscitore_inst : riconoscitore
        port map (
            i=>i, 
            RST=>RST, 
            CLK=>CLK, 
            M=>M, 
            Y=>Y
    );

    process(CLK)
    begin
    if rising_edge(CLK) then
        if B2='1' then
            i<='0';
            M<=S2;
        elsif B1='1' then
            i<=S1;
        end if;
    end if;
    end process;

    LED <= Y;
    
end Behavioral;
