library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity unita_controllo_A is
    Port ( clock : in STD_LOGIC;
           start : in STD_LOGIC;
           reset : in STD_LOGIC;
           read : out STD_LOGIC;
           enable : out STD_LOGIC;
           count : in STD_LOGIC_VECTOR(3 downto 0);
           req : out std_logic;
           ack : in std_logic);
end unita_controllo_A;

architecture Behavioral of unita_controllo_A is

    type state is (idle, s1, s2, s3, s4);
	signal current_state, next_state: state;
    
begin
    reg_stato: process(clock)
    begin
	   if(clock'event and clock='1') then
	       if(reset='1') then 
		      current_state <= idle;
		   else 
			  current_state <= next_state;
		   end if;
	   end if;
	end process;
			  
	comb: process(current_state, start, count, ack) 
	variable last_op : integer;
    begin
		case current_state is
		
		   when idle => 
              last_op := 0;
              if(start='1') then 
                next_state <= s1;
              else 
                next_state <= idle;
              end if;
			
	       when s1 => 
	           read <= '1';
               enable <= '0';
               next_state <= s2;
	       
	       when s2 =>
	           req <= '1';
	           read <= '0';
	           if(ack/='1') then
	               next_state <= s2;
	           else next_state <= s3;
	           end if;
	           
	       when s3 =>
	           req <= '0';
	           if(ack='1') then
	               next_state <= s3;
	           else 
	               next_state <= s4;
		       end if;
		       
		   when s4 =>
		       if(count="0000" and last_op/=0) then
	               next_state <= idle;
	           else 
	              last_op:=1;
	              enable <= '1';
		          next_state <= s1;
		       end if;
		   
		end case;
    end process; 
  
end Behavioral;