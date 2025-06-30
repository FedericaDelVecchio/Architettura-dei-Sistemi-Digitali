library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity ROM2 is
  generic (
    DATA_WIDTH    : integer := 8;   -- Larghezza del dato in bit
    DEPTH         : integer := 16;   -- Dimensione della ROM
    ADDRESS_WIDTH : integer := 4    -- Larghezza dell'indirizzo in bit
  );
  Port (
    address : in STD_LOGIC_VECTOR(ADDRESS_WIDTH-1 downto 0);
    dataOut : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
  );
end ROM2;

architecture Behavioral of ROM2 is

  type ROMArray is array (0 to DEPTH-1) of STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
  signal rom_data : ROMArray;
  
begin
  
  init_ROM: process -- DEPTH-1,DEPTH-2,DEPTH-3...
  begin
    for i in 0 to DEPTH-1 loop
      rom_data(i) <= std_logic_vector(to_unsigned(DEPTH-1-i, DATA_WIDTH));
    end loop;
    wait;
  end process;

  process(address)
  begin
    dataOut <= rom_data(to_integer(unsigned(address)));
  end process;
end Behavioral;