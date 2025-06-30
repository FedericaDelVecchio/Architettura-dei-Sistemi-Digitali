library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nodo_A_tb is
end nodo_A_tb;

architecture behavior of nodo_A_tb is
    signal tb_clock : std_logic := '0';
    signal tb_start : std_logic := '0';
    signal tb_reset : std_logic := '0';
    signal tb_ack : std_logic := '0';
    signal tb_req : std_logic;
    signal tb_data1 : std_logic_vector(3 downto 0);
    signal tb_data2 : std_logic_vector(3 downto 0);

    constant clk_period : time := 10 ns;

    component node_A is
        Port (
            clock : in STD_LOGIC;
            start : in STD_LOGIC;
            reset : in STD_LOGIC;
            ack : in std_logic;
            req : out std_logic;
            data1 : out std_logic_vector(3 downto 0);
            data2 : out std_logic_vector(3 downto 0)
        );
    end component;

begin
   uut: node_A port map (
            clock => tb_clock,
            start => tb_start,
            reset => tb_reset,
            ack => tb_ack,
            req => tb_req,
            data1 => tb_data1,
            data2 => tb_data2
        );
        
    clk : process
    begin
        tb_clock <= '0';
        wait for clk_period / 2;
        tb_clock <= '1';
        wait for clk_period / 2;
    end process;

    stim: process
    begin
        wait for 10 ns;

        tb_start <= '1';
        wait for 10 ns;
        tb_start <= '0';

        for i in 1 to 8 loop
            wait for 30 ns;
            tb_ack <= '1';
            wait for 10 ns;
            tb_ack <= '0';
        end loop;        

        wait;
    end process;
end behavior;
