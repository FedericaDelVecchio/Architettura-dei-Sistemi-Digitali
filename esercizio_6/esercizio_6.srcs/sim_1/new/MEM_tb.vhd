library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM_tb is
end entity MEM_tb;

architecture testbench of MEM_tb is
    signal clk : std_logic := '0';
    signal address : std_logic_vector(3 downto 0) := "0000";
    signal d_in : std_logic_vector(3 downto 0) := "0000";
    signal write : std_logic := '0';
    signal d_out : std_logic_vector(3 downto 0) := "0000";
    
    component MEM
        port (
            clk     : in  std_logic;
            address : in  std_logic_vector(3 downto 0);
            d_in    : in  std_logic_vector(3 downto 0);
            write   : in  std_logic;
            d_out   : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    uut: MEM port map(
        clk => clk,
        address => address,
        d_in => d_in,
        write => write,
        d_out => d_out
    );

    clock: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;

    stimuli: process
    begin
        wait for 5 ns;
        
        address <= "0101";
        d_in <= "1100";
        write <= '1';
        
        wait for 30 ns;
        write <= '0';
        
        wait for 30 ns;

        address <= "1110";
        d_in <= "0110";
        write <= '1';
        wait for 30 ns;
        
        d_in <= "0000";
        write <= '0';
        
        wait;
    end process stimuli;

end architecture testbench;
