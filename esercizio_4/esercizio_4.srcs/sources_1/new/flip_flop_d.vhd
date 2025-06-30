library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity flip_flop_d is Port ( 
    clk    : in STD_LOGIC;
    reset  : in STD_LOGIC;
    d      : in STD_LOGIC;
    q      : out STD_LOGIC);
end flip_flop_d;

architecture Behavioral of flip_flop_d is

    signal q_out : STD_LOGIC;
    
begin
    process(clk, reset)
    begin
        if reset = '1' then
            q_out <= '0';
        elsif rising_edge(clk) then
            q_out <= d;
        end if;
    end process;

    q <= q_out;
    
end Behavioral;
