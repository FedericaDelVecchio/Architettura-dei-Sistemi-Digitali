library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is
	port( parallel_in: in std_logic_vector(16 downto 0); -- (8 bit per A) & (9 bit per Q)
		  clock, reset, load, shift: in std_logic;
		  parallel_out: out std_logic_vector(16 downto 0));		  
end shift_register;

architecture Behavioural of shift_register is

	signal temp: std_logic_vector(16 downto 0);
	
begin
	
	registro_a_scorrimento: process(clock)
	begin
	   if(clock'event and clock='1') then
		  if(reset='1') then 
		      temp <= (others=>'0');
		  else
		      if(load='1') then
                 temp <= parallel_in;
              elsif(shift='1') then 							
                 temp(14 downto 0) <= temp(15 downto 1);
              end if;
          end if; 
	   end if;
	end process;
	
	parallel_out <= temp;
	
end Behavioural;
		
			