library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sistema_complessivo is
end entity tb_sistema_complessivo;

architecture Behavioral of tb_sistema_complessivo is

    signal clock : std_logic := '0';
    signal start : std_logic := '0';
    signal reset : std_logic := '0';
   
begin
    sis_tot: entity work.sistema_complessivo
    port map (
        clock => clock,
        start => start,
        reset => reset
    );

    clock <= not clock after 1 ps;

    stimulus: process
    begin
        wait for 2 ps;
        start <= '1';
        wait for 2 ps;
        start <= '0';

        wait;
    end process stimulus;
end architecture Behavioral;
