library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_carry is
	port( X, Y: in std_logic_vector(7 downto 0);
		  c_in: in std_logic;
		  c_out: out std_logic;
		  Z: out std_logic_vector(7 downto 0));
end ripple_carry;

architecture Structural of ripple_carry is
	component full_adder is port(
        a, b: in std_logic; 
        cin: in std_logic;
        cout, s: out std_logic);
	end component;
	
	signal temp: std_logic_vector(7 downto 0);
	
	begin
	
	full_adder_0: full_adder port map(a=>X(0), b=>Y(0), cin=>c_in, cout=>temp(0), s=>Z(0));
	
	full_adder_1_to_6: for i in 1 to 6 generate
	   f_a: full_adder port map(a=>X(i), b=>Y(i), cin=>temp(i-1), cout=>temp(i), s=>Z(i));
	   end generate;
			
	full_adder_7: full_adder port map(a=>X(7), b=>Y(7), cin=>temp(6), cout=>c_out, s=>Z(7));
	
end Structural;