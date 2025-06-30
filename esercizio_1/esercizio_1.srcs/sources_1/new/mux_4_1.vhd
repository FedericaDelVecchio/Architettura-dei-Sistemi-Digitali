library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_4_to_1 is
    Port ( D0, D1, D2, D3 : in STD_LOGIC;
           S0, S1 : in STD_LOGIC;
           Y : out STD_LOGIC);
end mux_4_to_1;

architecture Behavioral of mux_4_to_1 is
begin
    process (S0, S1, D0, D1, D2, D3)
    begin
        if (S0 = '0' and S1 = '0') then
            Y <= D0;
        elsif (S0 = '0' and S1 = '1') then
            Y <= D1;
        elsif (S0 = '1' and S1 = '0') then
            Y <= D2;
        elsif (S0 = '1' and S1 = '1') then
            Y <= D3;
        else
            Y <= '-';
        end if;
    end process;
end Behavioral;
