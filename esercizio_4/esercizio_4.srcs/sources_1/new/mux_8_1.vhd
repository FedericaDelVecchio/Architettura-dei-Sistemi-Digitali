library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_8_1 is
    Port ( 
        input_0 : in STD_LOGIC;
        input_1 : in STD_LOGIC;
        input_2 : in STD_LOGIC;
        input_3 : in STD_LOGIC;
        input_4 : in STD_LOGIC;
        input_5 : in STD_LOGIC;
        input_6 : in STD_LOGIC;
        input_7 : in STD_LOGIC;
        control : in STD_LOGIC_VECTOR(2 downto 0);
        output : out STD_LOGIC
    );
end mux_8_1;

architecture Behavioral of mux_8_1 is

begin

    process (input_0, input_1, input_2, input_3, input_4, input_5, input_6, input_7, control)
    begin
        case control is
            when "000" =>
                output <= input_0;
            when "001" =>
                output <= input_1;
            when "010" =>
                output <= input_2;
            when "011" =>
                output <= input_3;
            when "100" =>
                output <= input_4;
            when "101" =>
                output <= input_5;
            when "110" =>
                output <= input_6;
            when "111" =>
                output <= input_7;
            when others =>
                output <= '0';
        end case;
    end process;
    
end Behavioral;
