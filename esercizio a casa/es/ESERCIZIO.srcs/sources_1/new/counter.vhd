library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
  generic (
    WIDTH : integer := 8 
  );
  Port (
    clk    : in STD_LOGIC; 
    rst    : in STD_LOGIC;
    enable : in STD_LOGIC; 
    count  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)  
  );
end counter;

architecture Behavioral of counter is

  signal c : STD_LOGIC_VECTOR(WIDTH-1 downto 0) := (others => '0');
  
begin
  process(clk, rst)
  begin
    if rst = '1' then
      c <= (others => '0'); 
    elsif rising_edge(clk) and enable = '1' then
      c <= c + 1;  
    end if;
  end process;
  
  count <= c; 
end Behavioral;
