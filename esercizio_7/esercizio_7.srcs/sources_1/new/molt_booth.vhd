library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity molt_booth is
	 port( clock, reset, start: in std_logic;
		   X, Y: in std_logic_vector(7 downto 0);		  
		   P: out std_logic_vector(15 downto 0);
		   stop_cu: out std_logic);
end molt_booth;

architecture Structural of molt_booth is

	component control_unit is 
		port( q0, q_1, clock, reset, start: in std_logic;
		  count: in std_logic_vector(3 downto 0);
		  load_M, count_en, load_SR, shift: out std_logic;
		  subtract, stop_cu: out std_logic;
		  sel_SR : out std_logic_vector(1 downto 0)); 
	end component;
	
	component operational_unit is
	   port( X, Y: in std_logic_vector(7 downto 0);
		  clock, reset: in std_logic;
		  load_SR, shift, load_M, subtract, count_en: in std_logic;
		  sel_SR : in std_logic_vector(1 downto 0);
		  count: out std_logic_vector(3 downto 0);
		  P: out std_logic_vector(16 downto 0));
	end component;
	
	signal temp_q0,temp_q_1  : std_logic :='0';
	signal temp_sel_M, temp_subtract, temp_load_SR: std_logic;
	signal temp_sel_SR: std_logic_vector(1 downto 0);
	signal temp_count: std_logic_vector(3 downto 0);
	signal temp_p: std_logic_vector(16 downto 0);
	signal temp_count_en: std_logic;
	signal temp_shift: std_logic;
	signal temp_load_M: std_logic;
	
begin
	
	unita_di_controllo: control_unit port map
	   (q0 => temp_q0,
	   q_1 => temp_q_1, 
	   clock => clock, 
	   reset => reset, 
	   start => start, 
	   count => temp_count, 
	   load_M => temp_load_M, 
	   count_en => temp_count_en, 
	   load_SR => temp_load_SR, 
	   shift => temp_shift, 
	   subtract => temp_subtract, 
	   stop_cu => stop_cu,
	   sel_SR => temp_sel_SR);		  
	
	unita_operativa: operational_unit port map
	   (X => X, 
	   Y => Y, 
	   clock => clock, 
	   reset => reset, 
	   load_SR => temp_load_SR, 
	   shift => temp_shift, 
	   load_M => temp_load_M, 
	   subtract => temp_subtract,
	   count_en => temp_count_en, 
	   sel_SR => temp_sel_SR, 
	   count => temp_count, 
	   P => temp_p); 
		  
	temp_q0 <= temp_p(1); 
	temp_q_1 <= temp_p(0);
	P <= temp_p(16 downto 1);
	
end Structural;