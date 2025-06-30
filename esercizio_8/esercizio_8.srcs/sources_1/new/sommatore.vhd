library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sommatore is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0));
end sommatore;

architecture Dataflow of sommatore is
begin
    sum <= std_logic_vector(unsigned(A) + unsigned(B));
end Dataflow;