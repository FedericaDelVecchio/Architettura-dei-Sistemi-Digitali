library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity S_board is port (
		 switch : in STD_LOGIC_VECTOR(3 downto 0);
		 led : out STD_LOGIC_VECTOR (3 downto 0)
		 );
end S_board;

architecture Structural of S_board is

component ROM port(
        address : in  std_logic_vector(3 downto 0);
        d_out    : out std_logic_vector(7 downto 0)
    );
end component;

component M port(
        x : in  std_logic_vector(7 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
end component;
  signal d : std_logic_vector(7 downto 0) := (others=>'0');
  
begin


mem_rom : ROM port map (
    address => switch,
    d_out => d
);
    
machine_M : M port map (
    x => d,
    y => led
    );
    
end Structural;
