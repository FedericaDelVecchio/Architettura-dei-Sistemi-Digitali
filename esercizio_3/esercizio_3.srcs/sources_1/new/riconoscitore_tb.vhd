library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity riconoscitore_tb is
end riconoscitore_tb;

architecture Behavioral of riconoscitore_tb is

component riconoscitore
    port (
         i: in std_logic;
		  RST, CLK: in std_logic;
		  M : in std_logic;
		  Y: out std_logic
        );
    end component;
    
   signal i : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0'; 
   signal M : std_logic := '0';

   signal Y : std_logic;

   constant CLK_period : time := 10 ns;
 
BEGIN
   dut: riconoscitore port map(
          i => i,
          CLK => CLK,
          RST => RST,
          M => M,
          Y => Y
        );

   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   stim_proc: process
   begin		
        wait for 100 ns;	
        M<='0';
		i<='0';
		wait for 10 ns;
		i<='0';
		wait for 10 ns;
		i<='1';
		wait for 10 ns;
		i<='0';
		wait for 10 ns;
		i<='1';
		wait for 10 ns;
		i<='0';
		wait for 10 ns;
		i<='1';
		wait for 10 ns;
		i<='0';
	    wait for 100 ns;
		M<='1';
		i<='0';
		wait for 50 ns;
		i<='0';
		wait for 10 ns;
		i<='1';
		wait for 10 ns;
		i<='0';
		wait for 10 ns;
		i<='1';
		wait for 10 ns;
		i<='1';
		wait for 10 ns;
		i<='0';
		wait for 10 ns;
		i<='1';
        wait;
   end process;
end;