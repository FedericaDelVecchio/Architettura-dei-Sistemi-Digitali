library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench_B is
end testbench_B;

architecture Behavioral of testbench_B is
    component sistema_B is
        Port (
            clock : in std_logic;
            reset : in std_logic;
            req : in std_logic;
            ack : out std_logic;
            data : in std_logic_vector(3 downto 0)
        );
    end component;

    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal req : std_logic := '0';
    signal ack : std_logic;
    signal data : std_logic_vector(3 downto 0) := (others => '0');

begin
    uut: sistema_B port map (
        clock => clock,
        reset => reset,
        req => req,
        ack => ack,
        data => data
    );

    clock_gen: process
    begin
        wait for 10 ns;
        clock <= not clock;
    end process;

    stimuli: process
    begin    
        wait for 20 ns;
        
        data <= "0001"; 
        req <= '1';
        wait for 70 ns;
        req <= '0';  
        wait for 50 ns;
        
        req <= '1';
        wait for 70 ns;
        req <= '0';
        wait for 50 ns;      
        
        req <= '1';
        wait for 70 ns;
        req <= '0';
        wait for 50 ns;    
        
        req <= '1';
        wait for 70 ns;
        req <= '0';
        wait for 50 ns;      
        
        req <= '1';
        wait for 70 ns;
        req <= '0';
        wait for 50 ns;  
            
        req <= '1';
        wait for 70 ns;
        req <= '0';
        wait for 50 ns;      
        
        req <= '1';
        wait for 70 ns;
        req <= '0';
        wait for 50 ns;   
        
        req <= '1';
        wait for 70 ns;
        req <= '0';
        wait for 80 ns;      
   
        wait;
end process;

end Behavioral;
