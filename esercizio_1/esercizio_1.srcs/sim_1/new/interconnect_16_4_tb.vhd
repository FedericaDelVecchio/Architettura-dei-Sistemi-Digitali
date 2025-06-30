library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity interconnect_16_4_tb is
end interconnect_16_4_tb;

architecture testbench of interconnect_16_4_tb is
    signal d_in_tb   : STD_LOGIC_VECTOR(15 downto 0);
    signal s_in_tb   : STD_LOGIC_VECTOR(3 downto 0);
    signal s_out_tb  : STD_LOGIC_VECTOR(1 downto 0);
    signal d_out_tb  : STD_LOGIC_VECTOR(3 downto 0);

    component interconnect_16_4
        port (
            d_in  : in  STD_LOGIC_VECTOR(15 downto 0);
            s_in  : in  STD_LOGIC_VECTOR(3 downto 0);
            s_out : in  STD_LOGIC_VECTOR(1 downto 0);
            d_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

begin
    uut : interconnect_16_4
        port map (
            d_in  => d_in_tb,
            s_in  => s_in_tb,
            s_out => s_out_tb,
            d_out => d_out_tb
        );

    stimuli : process
    begin
        d_in_tb  <= (others => '0');
        s_in_tb  <= "0000";
        s_out_tb <= "00";

        wait for 10 ns;
        d_in_tb  <= "1111111100000000"; 
        s_in_tb  <= "0010";          
        s_out_tb <= "11";         
        wait for 10 ns;

        d_in_tb  <= "1111111111111111"; 
        s_in_tb  <= "0001";     
        s_out_tb <= "01";     
        wait for 10 ns;

        d_in_tb  <= "0000000011111111"; 
        s_in_tb  <= "0011";  
        s_out_tb <= "10";       
        wait for 10 ns;
        
        wait;
    end process;
end testbench;
