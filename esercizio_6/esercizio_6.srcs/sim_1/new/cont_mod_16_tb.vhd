library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont_mod_16_tb is
end entity cont_mod_16_tb;

architecture testbench of cont_mod_16_tb is
    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal enable : std_logic := '0';
    signal stop : std_logic := '0';
    signal count : std_logic_vector(3 downto 0) := (others => '0');

    component cont_mod_16
        port (
            clk     : in  std_logic;
            rst     : in  std_logic;
            enable  : in  std_logic;
            stop    : out std_logic;
            count   : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    uut: cont_mod_16 port map(
        clk => clk,
        rst => rst,
        enable => enable,
        stop => stop,
        count => count
    );
    
    clock: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;

    stim: process
    begin
        rst <= '0';
        wait for 30 ns;
        
        enable <= '1';
        wait for 600 ns;
        
        rst <= '1';
        wait for 60 ns;
        enable <= '0';
        
        wait;
    end process stim;

end architecture testbench;
