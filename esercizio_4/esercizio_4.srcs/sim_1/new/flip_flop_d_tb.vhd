library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop_d_tb is
end flip_flop_d_tb;

architecture testbench of flip_flop_d_tb is
    signal clk, reset, d, q : STD_LOGIC :='0';

    component flip_flop_d
        Port ( 
            clk    : in STD_LOGIC;
            reset  : in STD_LOGIC;
            d      : in STD_LOGIC;
            q      : out STD_LOGIC);
    end component;

begin
    clk_process: process
    begin
        while now < 100 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;
    
    uut: flip_flop_d port map (
        clk   => clk,
        reset => reset,
        d     => d,
        q     => q
    );

    stim: process
    begin
        wait for 10 ns;

        reset <= '1';
        wait for 5 ns;
        reset <= '0';

        wait for 5 ns;
        d <= '1';
        wait for 10 ns;
        assert q = '1' report "Error for d = 1" severity error;

        d <= '0';
        wait for 5 ns;
        assert q = '1' report "Error for d = 0" severity error;

        wait for 5 ns;
        d <= '1';
        wait for 10 ns;
        assert q = '1' report "Error for d = 1" severity error;

        wait for 5 ns;
        d <= '0';
        wait for 10 ns;
        assert q = '0' report "Error for d = 0" severity error;

        wait;
    end process;

end testbench;
