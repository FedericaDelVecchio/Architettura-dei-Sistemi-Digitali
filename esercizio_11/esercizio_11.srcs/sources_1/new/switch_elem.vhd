library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity switch_elem is
    Port (X_1, X_2 : in std_logic_vector(1 downto 0);
        src, dest : in std_logic;
        Y_1, Y_2 : out std_logic_vector(1 downto 0));
end switch_elem;

architecture Structural of switch_elem is

    component mux_2_1 is
    Port (d_in_1 : in std_logic_vector(1 downto 0);
        d_in_2 : in std_logic_vector(1 downto 0);
        sel : in std_logic;
        d_out : out std_logic_vector(1 downto 0));
    end component;

    component demux_1_2 is
    Port (d_in : in std_logic_vector(1 downto 0);
        sel : in std_logic;
        d_out_1 : out std_logic_vector(1 downto 0);
        d_out_2 : out std_logic_vector(1 downto 0));
    end component;
    
    signal mux_out_demux_in : std_logic_vector(1 downto 0);
    
begin
    multiplexer_2_1 : mux_2_1 port map(d_in_1 => X_1, d_in_2 => X_2, sel => src, d_out => mux_out_demux_in);
    
    demultiplexer_1_2 : demux_1_2 port map(d_in => mux_out_demux_in, sel => dest, d_out_1 => Y_1, d_out_2 => Y_2); 
end Structural;
