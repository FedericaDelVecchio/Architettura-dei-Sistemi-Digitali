library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MEM is
  generic (
    DATA_WIDTH : integer := 8;   -- Larghezza del dato in bit
    DEPTH      : integer := 16;  -- Dimensione della memoria
    ADDR_WIDTH : integer := 4     -- Larghezza dell'indirizzo in bit
  );
  Port (
    clk     : in STD_LOGIC;                      
    rst     : in STD_LOGIC;                      
    write   : in STD_LOGIC;                      
    read    : in STD_LOGIC;                      
    address : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0); 
    dataIn  : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    dataOut : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
  );
end MEM;

architecture Behavioral of MEM is

  type array_memoria is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
  signal memoria_interna : array_memoria := (others => (others => '0'));
  
begin
  process(clk, rst)
  begin
    if rst = '1' then
      memoria_interna <= (others => (others => '0'));
      
    elsif rising_edge(clk) then
    
      if write = '1' then
        memoria_interna(to_integer(unsigned(address))) <= dataIn; 
      end if;

      if read = '1' then
        dataOut <= memoria_interna(to_integer(unsigned(address))); 
      end if;
      
    end if;
  end process;
end Behavioral;
