library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity M is port(
        x : in  std_logic_vector(7 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
end entity M;

architecture Behavioral of M is
begin
    process(x)
    begin
        y <= (others => '0');
        y(3 downto 0) <= not(x(3 downto 0)); 
    end process;
end architecture behavioral;