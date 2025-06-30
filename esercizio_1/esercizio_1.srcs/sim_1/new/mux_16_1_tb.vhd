library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_16_1_tb is
end mux_16_1_tb;

architecture testbench of mux_16_1_tb is
    signal D_input : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
    signal S_input : STD_LOGIC_VECTOR(3 downto 0)  := "0000";
    signal Y_output : STD_LOGIC;

    component mux_16_1
        Port ( D : in STD_LOGIC_VECTOR(15 downto 0);
               S : in STD_LOGIC_VECTOR(3 downto 0);
               Y : out STD_LOGIC);
    end component;

begin
    MUX16to1 : mux_16_1
        port map (D => D_input, S => S_input, Y => Y_output);

    stimulus : process
    begin
        D_input <= "0000000000000001";
        S_input <= "0000";
        wait for 10 ns;

        D_input <= "1000000000000100";
        S_input <= "1110";
        wait for 10 ns;

        D_input <= "0000000000001000";
        S_input <= "0011";
        wait for 10 ns;

        D_input <= "0000000000010000";
        S_input <= "0110";
        wait for 10 ns;
       
        D_input <= "1000000100000000";
        S_input <= "1111";
        wait for 10 ns;
        
        D_input <= "0000000000000001";
        S_input <= "0000";
        wait for 10 ns;
        
        D_input <= "0000000000000100";
        S_input <= "0010";
        wait for 10 ns;
        
        D_input <= "1000000000000000";
        S_input <= "1111";
        wait for 10 ns;
        
        D_input <= "0100000000100000";
        S_input <= "0101";
        wait for 10 ns;

        wait;
    end process stimulus;

end testbench;
