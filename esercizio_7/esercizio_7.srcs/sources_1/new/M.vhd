library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity M is  -- registro che mantiene il moltiplicando Y
	port( Y_in: in std_logic_vector(7 downto 0);
		  clk, rst, load: in std_logic;
		  Y_out: out std_logic_vector(7 downto 0));
end M;

architecture Behavioural of M is

	signal y: std_logic_vector(7 downto 0);
	
begin
	
	molt: process(clk)
	begin
		if(clk'event and clk='1') then
		  if(rst='1') then
			 y <= (others=>'0');		   
		  else
		    if(load='1') then
			   y <= Y_in;
	        end if;
	      end if;
	    end if;
	end process;
	
	Y_out<=y;
	
end Behavioural;
		  