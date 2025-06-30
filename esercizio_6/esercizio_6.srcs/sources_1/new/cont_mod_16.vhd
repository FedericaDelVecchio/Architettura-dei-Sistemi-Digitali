library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cont_mod_16 is
    port (
        clk     : in  std_logic;
        rst     : in  std_logic;
        enable  : in  std_logic;
        count   : out std_logic_vector(3 downto 0)
    );
end entity cont_mod_16;

architecture Behavioral of cont_mod_16 is

    signal counter_value : unsigned(3 downto 0) := (others => '0');
    
begin

    process (clk, rst)
    begin
        if rst = '1' then
            counter_value <= (others => '0');
        elsif rising_edge(clk) and enable = '1' then
            if counter_value = 15 then
                counter_value <= (others => '0');
            else
                counter_value <= counter_value + 1;
            end if;
        end if;
    end process;

    count <= std_logic_vector(counter_value);

end architecture Behavioral;
