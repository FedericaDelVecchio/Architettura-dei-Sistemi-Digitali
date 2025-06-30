library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cronometro is
    port (
        clk : in std_logic;
        reset : in std_logic;
        set : in std_logic;
        init_sec : in integer range 0 to 59;
        init_min : in integer range 0 to 59;
        init_ore : in integer range 0 to 23;
        sec : out integer range 0 to 59;
        min : out integer range 0 to 59;
        ore : out integer range 0 to 23
    );
end entity;

architecture Structural of cronometro is
    component contatore
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
    end component;

    signal sec_count : integer range 0 to 59;
    signal min_count : integer range 0 to 59;
    signal ore_count : integer range 0 to 23;
    signal clock_tick_min : std_logic := '0';
    signal clock_tick_ore : std_logic := '0';
begin
    sec_counter : contatore
        generic map (MAX_VALUE => 59)
        port map (
            clk => clk,
            reset => reset,
            set => set,
            init_count => init_sec,
            count => sec_count
        );

    min_counter : contatore
        generic map (MAX_VALUE => 59)
        port map (
            clk => clock_tick_min,
            reset => reset,
            set => set,
            init_count => init_min,
            count => min_count
        );

    ore_counter : contatore
        generic map (MAX_VALUE => 23)
        port map (
            clk => clock_tick_ore,
            reset => reset,
            set => set,
            init_count => init_ore,
            count => ore_count
        );

    process(clk, reset)
    begin
        if rising_edge(clk) and reset='0' then
            if sec_count = 59 then
                clock_tick_min <= '1';
            else 
                clock_tick_min <= '0';
                clock_tick_ore <= '0';
            end if;
            
            if min_count = 59 and sec_count = 59 then
                clock_tick_ore <= '1';
            end if;

        end if;
    end process;

    sec <= sec_count;
    min <= min_count;
    ore <= ore_count;
end architecture;




