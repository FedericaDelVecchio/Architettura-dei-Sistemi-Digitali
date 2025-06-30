library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift_register_structural_tb is
end entity shift_register_structural_tb;

architecture testbench of shift_register_structural_tb is
    constant N : integer := 12;
    
    signal clk      : std_logic := '0';
    signal rst      : std_logic := '0';
    signal shift_dir: std_logic := '0';
    signal shift_amp: std_logic_vector(1 downto 0) := "00";
    signal din      : std_logic_vector(N-1 downto 0) := (others => '0');
    signal dout     : std_logic_vector(N-1 downto 0) := (others => '0');
    constant clk_period : time := 10 ns;

    component shift_register
        generic (
            N : integer := N
        );
        port (
            clk      : in  std_logic;
            rst      : in  std_logic;
            shift_dir: in  std_logic;
            shift_amp: in  std_logic_vector(1 downto 0);
            din      : in  std_logic_vector(N-1 downto 0);
            dout     : out std_logic_vector(N-1 downto 0)
        );
    end component;

begin
    dut: entity work.shift_register(Structural)
        generic map (N=>N)
        port map (
            clk      => clk,
            rst      => rst,
            dir      => shift_dir,
            Y        => shift_amp,
            din      => din,
            dout     => dout
        );
        
    CLK_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;


    process
    begin
        din <= "110101100111";
        shift_amp <= "00"; -- load
        wait for 10 ns;
        shift_dir <= '0'; -- shift a destra di...
        shift_amp <= "01"; -- ...1 posizione
        wait for 30 ns;
        shift_amp <= "10"; -- ...2 posizioni
        wait for 30 ns;
        
        din <= "010101110010";
        shift_amp <= "00"; -- load
        wait for 10 ns;
        shift_dir <= '1'; -- shift a sinistra di...
        shift_amp <= "01"; -- ...1 posizione
        wait for 30 ns;
        shift_amp <= "10"; -- ...2 posizioni
        wait;
    end process;

end architecture testbench;
