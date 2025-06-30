library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4_1_tb is
end mux_4_1_tb;

architecture testbench of mux_4_1_tb is
    signal D_input : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal S_input : STD_LOGIC_VECTOR(1 downto 0)  := "00";
    signal Y_output : STD_LOGIC;

    component mux_4_to_1
        Port ( D0, D1, D2, D3 : in STD_LOGIC;
               S0, S1 : in STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

begin
    MUX4to1 : mux_4_to_1
        port map (D0 => D_input(0), D1 => D_input(1), D2 => D_input(2), D3 => D_input(3),
                  S0 => S_input(0), S1 => S_input(1), Y => Y_output);

    stimulus : process
    begin
        D_input <= "0000";
        S_input <= "00";
        wait for 10 ns;

        D_input <= "1111";
        S_input <= "01";
        wait for 10 ns;

        D_input <= "0101";
        S_input <= "10";
        wait for 10 ns;

        D_input <= "1111";
        S_input <= "11";
        wait for 10 ns;

        wait;
    end process stimulus;
end testbench;
