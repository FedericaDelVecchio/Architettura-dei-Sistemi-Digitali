library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_1 is
    Port (d_in_1 : in std_logic_vector(1 downto 0);
        d_in_2 : in std_logic_vector(1 downto 0);
        sel : in std_logic;
        d_out : out std_logic_vector(1 downto 0));
end mux_2_1;

architecture Dataflow of mux_2_1 is
begin
    d_out <= d_in_1 when sel='0' else
            d_in_2 when sel='1' else
            "--";

end Dataflow;
