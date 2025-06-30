library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_41 is 
    generic (width : integer range 0 to 32 := 17);
    port( x0, x1, x2, x3: in std_logic_vector(width-1 downto 0); 
          s: in std_logic_vector(1 downto 0);
          y: out std_logic_vector(width-1 downto 0));
end mux_41;

architecture Behavioral of mux_41 is
begin

    process(s, x0, x1, x2, x3)
    begin
        case s is
            when "00" =>
                y <= x0;
            when "01" =>
                y <= x1;
            when "10" =>
                y <= x2;
            when others =>
                y <= x3;
        end case;
    end process;
    
end Behavioral;
