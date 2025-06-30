library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;

entity serial_adder_tb is
end serial_adder_tb;

architecture testbench of serial_adder_tb is

    component serial_adder
        port (
            A : in std_logic_vector (3 downto 0);
            B : in std_logic_vector (3 downto 0);
            clock : In std_logic;
            load : In std_logic;
            sum : Out std_logic_vector (3 downto 0)
        );
    END COMPONENT;

    signal A : std_logic_vector (3 DownTo 0) := "0000";
    signal B : std_logic_vector (3 DownTo 0) := "0000";
    signal clock : std_logic := '0';
    signal load : std_logic := '0';
    signal sum : std_logic_vector (3 downto 0) := "0000";

    begin
        dut : serial_adder
        port map (
            A => A,
            B => B,
            clock => clock,
            load => load,
            sum => sum
        );

        clk: process  
        begin
            clock <= '0';
            wait for 10ns;
            clock <= '1';
            wait for 10ns;
        end process;

        stim: process
            begin
                wait for 10 ns;
                load <= '1';
                A <= "0010";
                B <= "0001";
                wait for 10 ns;
                load <= '0';
                
                wait;
            end process;
END testbench;
