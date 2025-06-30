library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity molt_booth_tb is
end molt_booth_tb;

architecture Behavioral of molt_booth_tb is
    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal start : std_logic := '0';
    signal X, Y : std_logic_vector(7 downto 0);
    signal P : std_logic_vector(15 downto 0);
    signal stop_cu : std_logic;

    constant CLOCK_PERIOD : time := 10 ns;
begin
    uut: entity work.molt_booth
        port map (
            clock => clock,
            reset => reset,
            start => start,
            X => X,
            Y => Y,
            P => P,
            stop_cu => stop_cu
        );

    clk_process: process
    begin
        wait for CLOCK_PERIOD / 2;
        clock <= not clock;
    end process;

    stim: process
    begin
        start <= '0';
        X <= "00000110"; -- 6
        Y <= "11111011"; -- -5
        wait for CLOCK_PERIOD;
        start <= '1';
        wait for CLOCK_PERIOD;
        start <= '0';

        while stop_cu /= '1' loop -- aspetta che la moltiplicazione finisca
            wait for CLOCK_PERIOD;
        end loop;
                
        wait for 3*CLOCK_PERIOD;
        reset <= '1';
        wait for 10 ns;
        reset<='0';
        
        X <= "00000101"; -- 5
        Y <= "00000010"; -- 2
        start <= '1';
        wait for CLOCK_PERIOD;
        start <= '0';
        
        while stop_cu /= '1' loop
            wait for CLOCK_PERIOD;
        end loop;
        
        wait for 3*CLOCK_PERIOD;
        reset <= '1';
        wait for 10 ns;
        reset<='0';
        
        X <= "11111011"; -- -5
        Y <= "11111011"; -- -5
        start <= '1';
        wait for CLOCK_PERIOD;
        start <= '0';
        
        while stop_cu /= '1' loop
            wait for CLOCK_PERIOD;
        end loop;
        
        wait;
    end process;

end Behavioral;
