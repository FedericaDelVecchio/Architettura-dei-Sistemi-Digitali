library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity control_unit is 
	port( q0, q_1, clock, reset, start: in std_logic;
		  count: in std_logic_vector(3 downto 0);
		  load_M, count_en, load_SR, shift: out std_logic;
		  subtract, stop_cu: out std_logic;
		  sel_SR : out std_logic_vector(1 downto 0)); 
end control_unit;


architecture structural of control_unit is

	type state is (idle, acquisisci_op, fine_acquisisci, avvia_somma, avvia_shift, incr_count, fine);
	signal current_state,next_state: state;

begin 	
		
	reg_stato: process(clock)
    begin
	   if(clock'event and clock='1') then
	       if(reset='1') then 
		      current_state <=idle;
		   else 
			  current_state <=next_state;
		   end if;
	   end if;
	end process;
			  
	comb: process(current_state, start, count)
    begin
        count_en <='0'; 
        subtract <='0';
        sel_SR <= "00"; 
        load_SR <='0';
        load_M <='0';
        stop_cu <='0';  
        shift <='0';
         
		case current_state is
		
		  when idle => 
            if(start='1') then 
			  next_state <= acquisisci_op;
		    else 
		      next_state <= idle;
			end if;
		
		  when acquisisci_op => 
		    load_M <='1';
		    load_SR <='1';
			next_state <= fine_acquisisci;
			
		  when fine_acquisisci => 
		    next_state <= avvia_somma;
						
		  when avvia_somma => 
		    if(count="1000") then -- 9
		      stop_cu <= '1';
		      sel_SR <= "10";
		      next_state <= fine;
		    elsif(q0='0' and q_1='1') then
		      load_SR <='1';
		      sel_SR <= "01";
		      subtract <= '0';
		      next_state <= avvia_shift;
		    elsif(q0='1' and q_1='0') then
		      load_SR <='1';
		      sel_SR <= "01";
		      subtract <= '1';
		      next_state <= avvia_shift;
		    else -- q0=0=q_1 oppure q0=1=q_1
		      load_SR <='1';
		      sel_SR <= "10";
		      next_state <= avvia_shift;
		    end if;  
		    
		  when avvia_shift =>  
			 shift <= '1';
		     next_state <= incr_count;
			
		  when incr_count => 
		     count_en <= '1';
			 next_state <= avvia_somma;
		  
		  when fine => 
		     if(start/='1') then
                next_state <= fine;
             else next_state <= idle;
             end if;
		end case;
    end process; 
 end structural;