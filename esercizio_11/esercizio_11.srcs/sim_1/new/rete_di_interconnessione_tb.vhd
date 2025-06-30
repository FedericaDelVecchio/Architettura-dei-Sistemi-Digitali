library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rete_di_interconnesione_tb is
end rete_di_interconnesione_tb;

architecture testbench of rete_di_interconnesione_tb is
    signal S_1, S_2, S_3, S_4, D_1, D_2, D_3, D_4, sorgente, destinazione: std_logic_vector(1 downto 0);

    constant CLOCK_PERIOD: time := 10 ns; 

begin
    dut : entity work.rete_di_interconnesione
        port map(
            S_1 => S_1,
            S_2 => S_2,
            S_3 => S_3,
            S_4 => S_4,
            D_1 => D_1,
            D_2 => D_2,
            D_3 => D_3,
            D_4 => D_4,
            sorgente => sorgente,
            destinazione => destinazione
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
        S_1 <= "00";
        S_2 <= "11";
        S_3 <= "10";
        S_4 <= "01";
        sorgente <= "01";
        destinazione <= "10";
        wait for 20 ns;

        assert D_1 = "10" report "Error for Test 1" severity error;
        assert D_2 = "11" report "Error for Test 1" severity error;
        assert D_3 = "--" report "Error for Test 1" severity error;
        assert D_4 = "--" report "Error for Test 1" severity error;

        sorgente <= "10";
        destinazione <= "01";
        wait for 20 ns;

        assert D_1 = "--" report "Error for Test 2" severity error;
        assert D_2 = "--" report "Error for Test 2" severity error;
        assert D_3 = "00" report "Error for Test 2" severity error;
        assert D_4 = "11" report "Error for Test 2" severity error;

        sorgente <= "00";
        destinazione <= "11";
        wait for 20 ns;

        assert D_1 = "--" report "Error for Test 3" severity error;
        assert D_2 = "--" report "Error for Test 3" severity error;
        assert D_3 = "10" report "Error for Test 3" severity error;
        assert D_4 = "01" report "Error for Test 3" severity error;

        sorgente <= "01";
        destinazione <= "01";
        wait for 20 ns;

        assert D_1 = "01" report "Error for Test 4" severity error;
        assert D_2 = "--" report "Error for Test 4" severity error;
        assert D_3 = "--" report "Error for Test 4" severity error;
        assert D_4 = "--" report "Error for Test 4" severity error;

        sorgente <= "10";
        destinazione <= "10";
        wait for 20 ns;

        assert D_1 = "--" report "Error for Test 5" severity error;
        assert D_2 = "10" report "Error for Test 5" severity error;
        assert D_3 = "--" report "Error for Test 5" severity error;
        assert D_4 = "--" report "Error for Test 5" severity error;

        sorgente <= "11";
        destinazione <= "00";
        wait for 20 ns;

        assert D_1 = "--" report "Error for Test 6" severity error;
        assert D_2 = "--" report "Error for Test 6" severity error;
        assert D_3 = "00" report "Error for Test 6" severity error;
        assert D_4 = "--" report "Error for Test 6" severity error;

        wait;
    end process;

end testbench;
