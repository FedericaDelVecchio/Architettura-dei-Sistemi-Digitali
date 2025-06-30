library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux_16_1 is
    Port ( D : in STD_LOGIC_VECTOR(15 downto 0);
           S : in STD_LOGIC_VECTOR(3 downto 0);
           Y : out STD_LOGIC);
end mux_16_1;

architecture Structural of mux_16_1 is
    signal intermediate_signals : STD_LOGIC_VECTOR(3 downto 0);
    signal Y_temp : STD_LOGIC;

    component mux_4_to_1
        Port ( D0, D1, D2, D3 : in STD_LOGIC;
               S0, S1 : in STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

begin
    MUX0: mux_4_to_1 port map (
        D0 => D(0), D1 => D(1), D2 => D(2), D3 => D(3),
        S0 => S(1), S1 => S(0),
        Y => intermediate_signals(0)
    );

    MUX1: mux_4_to_1 port map (
        D0 => D(4), D1 => D(5), D2 => D(6), D3 => D(7),
        S0 => S(1), S1 => S(0),
        Y => intermediate_signals(1)
    );

    MUX2: mux_4_to_1 port map (
        D0 => D(8), D1 => D(9), D2 => D(10), D3 => D(11),
        S0 => S(1), S1 => S(0),
        Y => intermediate_signals(2)
    );

    MUX3: mux_4_to_1 port map (
        D0 => D(12), D1 => D(13), D2 => D(14), D3 => D(15),
        S0 => S(1), S1 => S(0),
        Y => intermediate_signals(3)
    );

    MUX_final: mux_4_to_1 port map (
        D0 => intermediate_signals(0),
        D1 => intermediate_signals(1),
        D2 => intermediate_signals(2),
        D3 => intermediate_signals(3),
        S0 => S(3),
        S1 => S(2),
        Y => Y_temp
    );

    Y <= Y_temp;
end Structural;
