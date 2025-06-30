library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1_2 is
    Port (d_in : in std_logic_vector(1 downto 0);
        sel : in std_logic;
        d_out_1 : out std_logic_vector(1 downto 0);
        d_out_2 : out std_logic_vector(1 downto 0));
end demux_1_2;

architecture Dataflow of demux_1_2 is
begin
    d_out_1 <= d_in when sel='0' else "--";
    
    d_out_2 <= d_in when sel='1' else "--";
end Dataflow;
