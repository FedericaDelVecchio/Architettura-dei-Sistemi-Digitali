library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_8_1_tb is
end mux_8_1_tb;

architecture testbench of mux_8_1_tb is
    signal clk : STD_LOGIC := '0';
    signal input_0, input_1, input_2, input_3, input_4, input_5, input_6, input_7 : STD_LOGIC := '0';
    signal control : STD_LOGIC_VECTOR(2 downto 0) :=(others=>'0');
    signal output : STD_LOGIC := '0';

    component mux_8_1
        Port ( 
            input_0 : in STD_LOGIC;
            input_1 : in STD_LOGIC;
            input_2 : in STD_LOGIC;
            input_3 : in STD_LOGIC;
            input_4 : in STD_LOGIC;
            input_5 : in STD_LOGIC;
            input_6 : in STD_LOGIC;
            input_7 : in STD_LOGIC;
            control : in STD_LOGIC_VECTOR(2 downto 0);
            output : out STD_LOGIC
        );
    end component;

begin
    clk_process: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;

    stim: process
    begin
        wait for 2 ns;
        input_0 <= '0'; 
        input_1 <= '1'; 
        input_2 <= '0'; 
        input_3 <= '1';
        input_4 <= '0'; 
        input_5 <= '1'; 
        input_6 <= '0'; 
        input_7 <= '1';
        
        control <= "000"; wait for 2 ns;
        assert output = '0' report "Error for control = 000" severity error;

        control <= "001"; wait for 2 ns;
        assert output = '1' report "Error for control = 001" severity error;

        control <= "010"; wait for 2 ns;
        assert output = '0' report "Error for control = 010" severity error;

        control <= "011"; wait for 2 ns;
        assert output = '1' report "Error for control = 011" severity error;

        control <= "100"; wait for 2 ns;
        assert output = '0' report "Error for control = 100" severity error;

        control <= "101"; wait for 2 ns;
        assert output = '1' report "Error for control = 101" severity error;

        control <= "110"; wait for 2 ns;
        assert output = '0' report "Error for control = 110" severity error;

        control <= "111"; wait for 2 ns;
        assert output = '1' report "Error for control = 111" severity error;

        wait;
    end process;

    uut: mux_8_1 port map (
        input_0 => input_0,
        input_1 => input_1,
        input_2 => input_2,
        input_3 => input_3,
        input_4 => input_4,
        input_5 => input_5,
        input_6 => input_6,
        input_7 => input_7,
        control => control,
        output => output
    );

end testbench;
