library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_sistema_totale is
end tb_sistema_totale;

architecture tb_architecture of tb_sistema_totale is
    signal en0, en1, en2, en3 : std_logic;
    signal in0, in1, in2, in3 : std_logic_vector(5 downto 0);
    signal out0, out1, out2, out3 : std_logic_vector(1 downto 0);
    
    component sistema_totale
        Port (en0, en1, en2, en3 : in std_logic;
              in0, in1, in2, in3 : in std_logic_vector(5 downto 0);
              out0, out1, out2, out3 : out std_logic_vector(1 downto 0));
    end component;
    

begin
    uut: sistema_totale port map (
        en0 => en0,
        en1 => en1,
        en2 => en2,
        en3 => en3,
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        out0 => out0,
        out1 => out1,
        out2 => out2,
        out3 => out3
    );

    stim_process: process
    begin
        wait for 10 ns;
        en0 <= '1';
        en1 <= '1';
        en2 <= '1';
        en3 <= '1';

        in0 <="001100"; --11 a 2
        in1 <="011001"; --11 a 3
        in2 <="100110"; --10 a 0
        in3 <="110011"; --00 a 1

        wait for 60 ns;
        en0 <= '0';
        
        wait for 60ns;
        en1 <= '0';
        
        wait for 60ns;
        en2 <= '0';
        wait;
    end process stim_process;

end tb_architecture;
