library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity S_tb is
end entity S_tb;

architecture testbench of S_tb is
    signal address : std_logic_vector(3 downto 0) := "0000";
    signal result : std_logic_vector(3 downto 0);

    component S port(
            address : in  std_logic_vector(3 downto 0);
            result : out std_logic_vector(3 downto 0)
        );
    end component S;

begin
    uut: S port map(
            address => address,
            result  => result
        );

    stimuli : process
    begin
        address <= "0000"; 
        wait for 10 ns;
        
        address <= "0001"; 
        wait for 10 ns;
        
        address <= "1000"; 
        wait for 10 ns;
        
        address <= "1101"; 
        wait for 10 ns;
        
        address <= "1111"; 
        wait for 10 ns;
        
        wait;
    end process;

    process
    begin
        wait for 50 ns;

        assert result = "0000" report "Errore all'indirizzo 0" severity error;
        assert result = "0001" report "Errore all'indirizzo 1" severity error;
        assert result = "1000" report "Errore all'indirizzo 8" severity error;
        assert result = "1101" report "Errore all'indirizzo 13" severity error;
        assert result = "1111" report "Errore all'indirizzo 15" severity error;
        
        wait;
    end process;
end architecture testbench;