library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity interconnect_16_4 is
    Port (
        d_in  : in  STD_LOGIC_VECTOR(15 downto 0);
        s_in  : in  STD_LOGIC_VECTOR(3 downto 0);
        s_out : in  STD_LOGIC_VECTOR(1 downto 0);
        d_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end interconnect_16_4;

architecture Structural of interconnect_16_4 is
    component mux_16_1
        port (
            D : in  STD_LOGIC_VECTOR(15 downto 0);
            S : in  STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    component demux_1_4
        port (
            D  : in  STD_LOGIC;
            S  : in  STD_LOGIC_VECTOR(1 downto 0);
            Y0 : out STD_LOGIC;
            Y1 : out STD_LOGIC;
            Y2 : out STD_LOGIC;
            Y3 : out STD_LOGIC
        );
    end component;

    signal mux_out : STD_LOGIC;

begin
    mux_16_inst : mux_16_1
        port map (
            D => d_in,
            S => s_in,
            Y => mux_out
        );

    demux_4_inst : demux_1_4
        port map (
            D  => mux_out,
            S  => s_out,
            Y0 => d_out(0),
            Y1 => d_out(1),
            Y2 => d_out(2),
            Y3 => d_out(3)
        );
end Structural;
