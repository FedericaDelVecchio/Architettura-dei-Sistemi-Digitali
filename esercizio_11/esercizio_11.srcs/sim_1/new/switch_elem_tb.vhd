library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity switch_elem_tb is
end switch_elem_tb;

architecture testbench of switch_elem_tb is
    signal X_1, X_2, Y_1, Y_2: std_logic_vector(1 downto 0);
    signal src, dest: std_logic := '0';

    constant CLOCK_PERIOD: time := 10 ns;
    
begin
    uut : entity work.switch_elem
        port map(
            X_1 => X_1,
            X_2 => X_2,
            src => src,
            dest => dest,
            Y_1 => Y_1,
            Y_2 => Y_2
        );

    process
    begin
        while now < 1000 ns loop
            wait for CLOCK_PERIOD / 2;
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    process
    begin
        X_1 <= "00";
        X_2 <= "11";
        src <= '0';
        dest <= '0';
        wait for 20 ns;
        assert Y_1 = "00" report "Error for src = '0', dest = '0'" severity error;
        assert Y_2 = "--" report "Error for src = '0', dest = '0'" severity error;

        X_1 <= "01";
        X_2 <= "10";
        src <= '1';
        dest <= '1';
        wait for 20 ns;
        assert Y_1 = "--" report "Error for src = '1', dest = '1'" severity error;
        assert Y_2 = "10" report "Error for src = '1', dest = '1'" severity error;

        X_1 <= "10";
        X_2 <= "01";
        src <= '0';
        dest <= '0';
        wait for 20 ns;
        assert Y_1 = "10" report "Error for src = '0', dest = '0'" severity error;
        assert Y_2 = "--" report "Error for src = '0', dest = '0'" severity error;

        X_1 <= "11";
        X_2 <= "00";
        src <= '1';
        dest <= '1';
        wait for 20 ns;
        assert Y_1 = "--" report "Error for src = '1', dest = '1'" severity error;
        assert Y_2 = "00" report "Error for src = '1', dest = '1'" severity error;

        wait;
    end process;

end testbench;
