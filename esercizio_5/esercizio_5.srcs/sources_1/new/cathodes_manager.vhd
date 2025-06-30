----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:29:17 22/10/2012 
-- Design Name: 
-- Module Name:    cathode_manager - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cathodes_manager is
    Port ( counter : in  STD_LOGIC_VECTOR (2 downto 0);
           value : in   std_logic_vector(16 downto 0); --dato di mostrare sugli 8 display
           dots : in  STD_LOGIC_VECTOR (7 downto 0); --configurazione punti da accendere
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0)); --sono i 7 catodi più il punto
end cathodes_manager;

architecture Behavioral of cathodes_manager is

constant zero   : std_logic_vector(6 downto 0) := "1000000"; 
constant one    : std_logic_vector(6 downto 0) := "1111001"; 
constant two    : std_logic_vector(6 downto 0) := "0100100"; 
constant three  : std_logic_vector(6 downto 0) := "0110000"; 
constant four   : std_logic_vector(6 downto 0) := "0011001"; 
constant five   : std_logic_vector(6 downto 0) := "0010010"; 
constant six    : std_logic_vector(6 downto 0) := "0000010"; 
constant seven  : std_logic_vector(6 downto 0) := "1111000"; 
constant eight  : std_logic_vector(6 downto 0) := "0000000"; 
constant nine   : std_logic_vector(6 downto 0) := "0010000"; 

alias sec is value (5 downto 0);
alias min is value (11 downto 6);
alias ore is value (16 downto 12);

signal cifra_0 : std_logic_vector(3 downto 0);
signal cifra_1 : std_logic_vector(3 downto 0);
signal cifra_2 : std_logic_vector(3 downto 0);
signal cifra_3 : std_logic_vector(3 downto 0);
signal cifra_4 : std_logic_vector(3 downto 0);
signal cifra_5 : std_logic_vector(3 downto 0);


signal cathodes_for_digit : std_logic_vector(6 downto 0) := (others => '0');
signal nibble :std_logic_vector(3 downto 0) := (others => '0');
signal dot :std_logic := '0'; --stabilisce se il punto relativo alla cifra visualizzata deve essere acceso o spento
                              --nota: dot=1 significa che deve essere acceso, ma il segnale deve essere negato per andare sui catodi 

begin 

    cifra_0 <= std_logic_vector(to_unsigned((to_integer(unsigned(sec)) rem 10),4));
    cifra_1 <= std_logic_vector(to_unsigned((to_integer(unsigned(sec)) / 10),4));
    cifra_2 <= std_logic_vector(to_unsigned((to_integer(unsigned(min)) rem 10),4));
    cifra_3 <= std_logic_vector(to_unsigned((to_integer(unsigned(min)) / 10),4));
    cifra_4 <= std_logic_vector(to_unsigned((to_integer(unsigned(ore)) rem 10),4));
    cifra_5 <= std_logic_vector(to_unsigned((to_integer(unsigned(ore)) / 10),4));
    
-- questo processo multiplexa le cifre da mostrare
digit_switching: process(counter)

begin
	case counter is
		when "000" =>
			nibble <= cifra_0;
			dot <= dots(0);
		when "001" =>
			nibble <= cifra_1;
			dot <= dots(1);
		when "010" =>
			nibble <= cifra_2;
			dot <= dots(2);
		when "011" =>
			nibble <= cifra_3;
			dot <= dots(3);
		when "100" =>
			nibble <= cifra_4;
			dot <= dots(4);
		when "101" =>
			nibble <= cifra_5;
			dot <= dots(5);
		when "110" =>
			nibble <= "0000";
			dot <= dots(6);
		when "111" =>
			nibble <= "0000";
			dot <= dots(7);
		when others =>
			nibble <= (others => '0');
			dot <= '0';
	end case;
end process;
			 
seven_segment_decoder_process: process(nibble) 
  begin 
    case nibble is 
      when "0000" => cathodes_for_digit <= zero; 
      when "0001" => cathodes_for_digit <= one; 
      when "0010" => cathodes_for_digit <= two; 
      when "0011" => cathodes_for_digit <= three; 
      when "0100" => cathodes_for_digit <= four; 
      when "0101" => cathodes_for_digit <= five; 
      when "0110" => cathodes_for_digit <= six; 
      when "0111" => cathodes_for_digit <= seven; 
      when "1000" => cathodes_for_digit <= eight; 
      when "1001" => cathodes_for_digit <= nine; 
		when others => cathodes_for_digit <= (others => '0');
    end case; 
  end process seven_segment_decoder_process;
  
cathodes <= (not dot)&cathodes_for_digit; 



end Behavioral;