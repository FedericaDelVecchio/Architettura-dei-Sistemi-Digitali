library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity demux_1_4 is
    Port ( D : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR(1 downto 0);
           Y0, Y1, Y2, Y3 : out STD_LOGIC);
end demux_1_4;

architecture Behavioral of demux_1_4 is
begin
    process (D, S)
    begin
        case S is
            when "00" =>
                Y0 <= D;
                Y1 <= '0';
                Y2 <= '0';
                Y3 <= '0';
            when "01" =>
                Y0 <= '0';
                Y1 <= D;
                Y2 <= '0';
                Y3 <= '0';
            when "10" =>
                Y0 <= '0';
                Y1 <= '0';
                Y2 <= D;
                Y3 <= '0';
            when "11" =>
                Y0 <= '0';
                Y1 <= '0';
                Y2 <= '0';
                Y3 <= D;
            when others =>
                Y0 <= '-';
                Y1 <= '-';
                Y2 <= '-';
                Y3 <= '-';
        end case;
    end process;
end Behavioral;
