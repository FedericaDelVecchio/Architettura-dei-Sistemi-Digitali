library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_4_1_tb is
end demux_4_1_tb;

architecture testbench of demux_4_1_tb is
    signal D_input : STD_LOGIC := '0';
    signal S_input : STD_LOGIC_VECTOR(1 downto 0)  := "00";
    signal Y0_output, Y1_output, Y2_output, Y3_output : STD_LOGIC;

    component demux_4_1
        Port ( D : in STD_LOGIC;
               S : in STD_LOGIC_VECTOR(1 downto 0);
               Y0, Y1, Y2, Y3 : out STD_LOGIC);
    end component;

begin
    DEMUX4to1 : demux_4_1
        port map (D => D_input, S => S_input,
                  Y0 => Y0_output, Y1 => Y1_output,
                  Y2 => Y2_output, Y3 => Y3_output);

    stimulus : process
    begin
        D_input <= '1';
        S_input <= "00";
        wait for 10 ns;

        D_input <= '1';
        S_input <= "01";
        wait for 10 ns;

        D_input <= '1';
        S_input <= "10";
        wait for 10 ns;

        D_input <= '1';
        S_input <= "11";
        wait for 10 ns;

        wait;
    end process stimulus;

end testbench;
