library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cronometro_tb is
end entity;

architecture tb of cronometro_tb is
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal set : std_logic := '0';
    signal init_sec : integer := 0;
    signal init_min : integer := 0;
    signal init_ore : integer := 0;
    signal sec : integer;
    signal min : integer;
    signal ore : integer;
begin
    crono_metro : entity work.cronometro
        port map (
            clk => clk,
            reset => reset,
            set => set,
            init_sec => init_sec,
            init_min => init_min,
            init_ore => init_ore,
            sec => sec,
            min => min,
            ore => ore
        );

    process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;

    process
    begin
        init_sec <= 50;
        init_min <= 59;
        init_ore <= 4;
        set <= '1';
        wait for 10 ns;
        set <= '0';

        wait for 200 ns;
        
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        
        wait for 650 ns;
        
        init_sec <= 58;
        init_min <= 59;
        init_ore <= 23;
        set <= '1';
        wait for 10 ns;
        set <= '0';
        
        wait for 100 ns;

        wait;
    end process;
end tb;
