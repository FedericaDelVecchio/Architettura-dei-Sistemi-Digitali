library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is -- modulo 9
    port( 
        clock, reset: in std_logic;
        enable: in std_logic;
        count: out std_logic_vector(3 downto 0)
    );
end counter;

architecture Behavioural of counter is

    signal c: std_logic_vector(3 downto 0) := (others=>'0');
    
begin

    contatore_mod_9: process(clock)
    begin
        if(rising_edge(clock)) then 
            if(reset='1') then 
                c <= (others=>'0');
            else 
                if(enable = '1') then
                    if (unsigned(c) = 9) then
                        c <= (others=>'0');
                    else
                        c <= std_logic_vector(unsigned(c) + 1);
                    end if;
                end if;
            end if;
        end if;
    end process;

    count <= c;

end Behavioural;
