library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity operational_unit is
	port( X, Y: in std_logic_vector(7 downto 0); --moltiplicatore e moltiplicando
		  clock, reset: in std_logic;
		  load_SR, shift, load_M, subtract, count_en: in std_logic;
		  sel_SR : in std_logic_vector(1 downto 0);
		  count: out std_logic_vector(3 downto 0);
		  P: out std_logic_vector(16 downto 0)); 
end operational_unit;

architecture Structural of operational_unit is

	component parallel_adder is
	port( X, Y: in std_logic_vector(7 downto 0);
		  cin: in std_logic;
		  Z: out std_logic_vector(7 downto 0);
		  cout: out std_logic);		  
	end component;
	
	component M is 
		port( Y_in: in std_logic_vector(7 downto 0);
		  clk, rst, load: in std_logic;
		  Y_out: out std_logic_vector(7 downto 0));
	end component;
	
	component shift_register is
	port( parallel_in: in std_logic_vector(16 downto 0);
		  clock, reset, load, shift: in std_logic;
		  parallel_out: out std_logic_vector(16 downto 0));	  
	end component;
	
	component counter is
	port( clock,  reset: in std_logic;
		  enable: in std_logic;
		  count: out std_logic_vector(3 downto 0));
	end component;
	
	component mux_41 is
	generic (width : integer range 0 to 32 := 17);
	port( x0, x1,x2,x3: in std_logic_vector(width-1 downto 0); 
		  s: in std_logic_vector(1 downto 0);
		  y: out std_logic_vector(width-1 downto 0));
	end component;

	signal op_2: std_logic_vector(7 downto 0); 
	signal SR_init: std_logic_vector(16 downto 0);
	signal SR_in: std_logic_vector(16 downto 0);
	signal SR_out: std_logic_vector(16 downto 0);
	signal sum: std_logic_vector(7 downto 0); 
	signal SR_sum : std_logic_vector(16 downto 0); 
	signal carry_out: std_logic; -- non utilizzato
	
begin

	moltiplicando: M port map(
	   Y_in => Y, 
	   clk => clock, 
	   rst => reset, 
	   load => load_M, 
	   Y_out => op_2);
	
	SR_init <= "00000000" & X & "0";  
    
    SR_sum <= sum & SR_out(8 downto 0);
    
    MUX_SR_parallel_in : mux_41 generic map (width => 17) port map(
        x0 => SR_init, 
        x1 => SR_sum,
        x2 => SR_out,
        x3 => "00000000000000000", -- mai selezionato
        s => sel_SR,
        y => SR_in);
    	
	registro_shift: shift_register port map(
	   parallel_in => SR_in, 
	   clock => clock,
	   reset => reset, 
	   load => load_SR, 
	   shift => shift, 
	   parallel_out => SR_out);
	
	sommatore_sottrattore: parallel_adder port map(
	   X => SR_out(16 downto 9), 
	   Y => op_2, 
	   cin => subtract, 
	   Z => sum, 
	   cout => carry_out);
	
	contatore_mod_9: counter port map(
	   clock => clock, 
	   reset => reset, 
	   enable => count_en, 
	   count => count);
	
	P <= SR_out;	

end Structural;
