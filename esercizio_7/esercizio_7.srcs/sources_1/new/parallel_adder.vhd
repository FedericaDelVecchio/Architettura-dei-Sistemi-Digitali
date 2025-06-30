library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parallel_adder is -- sommatore & sottrattore
	port( X, Y: in std_logic_vector(7 downto 0);
		  cin: in std_logic;
		  Z: out std_logic_vector(7 downto 0);
		  cout: out std_logic);		  
end parallel_adder;

architecture Structural of parallel_adder is

	component ripple_carry is
	port( X, Y: in std_logic_vector(7 downto 0);
		  c_in: in std_logic;
		  c_out: out std_logic;
		  Z: out std_logic_vector(7 downto 0));
	end component;
	
	signal compl_y: std_logic_vector(7 downto 0);
	
begin
	
	complemento_y: for i in 0 to 7 generate
				   compl_y(i)<=Y(i) xor cin;
				   end generate;
				   
	ripple_carry_adder: ripple_carry port map(
	   X=>X, 
	   Y=>compl_y, 
	   c_in=>cin, 
	   c_out=>cout, 
	   Z=>Z);
	
end structural;
	
	