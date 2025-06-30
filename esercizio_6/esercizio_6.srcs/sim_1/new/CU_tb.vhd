library IEEE;
use ieee.std_logic_1164.all;

entity CU_tb is
end entity CU_tb;

architecture testbench of CU_tb is
  signal start_tb, reset_tb, clk_tb : std_logic := '0';
  signal output_tb : std_logic_vector(3 downto 0);
  
  component CU
    port (
      start  : in std_logic;
      reset  : in std_logic;
      clk    : in std_logic;
      output : out std_logic_vector(3 downto 0)
    );
  end component;
  
begin
  clock: process
  begin
    while now < 1000 ns loop
      clk_tb <= not clk_tb after 2.5 ns;
      wait for 5 ns;
    end loop;
    wait;
  end process;

  stim : process
  begin
    wait for 10 ns;
    start_tb <= '1';
    wait for 20 ns;
    wait for 80 ns;
    start_tb <= '0';
    wait for 100 ns;
    
    start_tb <= '1';
    wait for 20 ns;
    start_tb <= '0';
    
    wait for 100 ns;
    reset_tb <= '1';
    wait for 20 ns;
    reset_tb <= '0';
    
    wait for 300 ns;
    start_tb <= '1';
    wait for 20 ns;
    start_tb <= '0';

    wait;
  end process;

  dut: CU
    port map (
      start  => start_tb,
      reset  => reset_tb,
      clk    => clk_tb,
      output => output_tb
    );

end architecture testbench;

