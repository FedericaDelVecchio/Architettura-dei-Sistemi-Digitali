library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_A is
end testbench_A;

architecture sim of testbench_A is
    signal clock : std_logic := '0';
    signal start : std_logic := '0';
    signal reset : std_logic := '0';
    signal ack : std_logic := '0';

    signal req : std_logic;
    signal data : std_logic_vector(3 downto 0);

    component sistema_A
        Port (
            clock : in std_logic;
            start : in std_logic;
            reset : in std_logic;
            req : out std_logic;
            ack : in std_logic;
            data : out std_logic_vector(3 downto 0)
        );
    end component;

begin
    uut : sistema_A
        port map (
            clock => clock,
            start => start,
            reset => reset,
            req => req,
            ack => ack,
            data => data
        );

    process
    begin
        wait for 5 ns;
        clock <= not clock;
    end process;

    process
    begin
        wait for 10 ns;

        start <= '1';
        wait for 10 ns;
        start <= '0';

        wait for 120 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';

        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';

        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';

        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait for 30 ns;
        ack <= '1';
        wait for 10 ns;
        ack <= '0';
        
        wait;
    end process;

end sim;
