library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM is
    port (
        clk     : in  std_logic;
        address : in  std_logic_vector(3 downto 0);
        d_in    : in  std_logic_vector(3 downto 0);
        write   : in  std_logic;
        d_out   : out std_logic_vector(3 downto 0)
    );
end entity MEM;

architecture RTL of MEM is
    type MEMORY_16_4 is array (0 to 15) of std_logic_vector(3 downto 0);
    signal mem_data : MEMORY_16_4 := (others => (others => '0'));

begin
    process (clk)
    begin
        if rising_edge(clk) then
            if write = '1' then
                mem_data(to_integer(unsigned(address))) <= d_in;
                d_out <= d_in;
            else 
                d_out <= "0000";
            end if;
        end if;
    end process;
    
end architecture RTL;
