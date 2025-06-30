library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM is
    port (
        clk     : in  std_logic;
        address : in  std_logic_vector(2 downto 0);
        read_write : in std_logic;
        d_in    : in  std_logic_vector(16 downto 0);
        d_out   : out std_logic_vector(16 downto 0)
    );
end entity MEM;

architecture RTL of MEM is
    type MEMORY is array (0 to 7) of std_logic_vector(16 downto 0);
    signal mem_data : MEMORY := (others => (others => '0'));

begin
    process (clk)
    begin
        if rising_edge(clk) then
           if(read_write='1') then --scrivi
                mem_data(to_integer(unsigned(address))) <= d_in;
           else d_out<=mem_data(to_integer(unsigned(address)));
           end if;
        end if;
    end process;
    
end architecture RTL;
