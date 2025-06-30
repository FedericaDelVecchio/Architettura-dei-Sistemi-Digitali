library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity serial_adder is
    generic (
        N : INTEGER := 4
        ); 
    port(
        clock : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR (N-1 downto 0); 
        B : in STD_LOGIC_VECTOR (N-1 downto 0); 
        load : in STD_LOGIC;
        sum : out STD_LOGIC_VECTOR(N-1 downto 0)
        );
end serial_adder;

architecture Behavioral of serial_adder is

    signal carry: STD_LOGIC;
    signal A_temp: STD_LOGIC_VECTOR(N-1 downto 0);
    signal B_temp: STD_LOGIC_VECTOR(N-1 downto 0);
    
begin
    
    process(clock)
    variable sum_temp: STD_LOGIC;
    begin
        if(rising_edge(clock)) then
            if (load = '1') then
               A_temp <= A;
               B_temp <= B;
               carry <= '0'; end if;
            else
                sum_temp := (A_temp(0) xor B_temp(0)) xor (carry);
                carry <= (((A_temp(0) xor B_temp(0)) and carry)) or (A_temp(0) and B_temp(0));
                B_temp <= ('0' & B_temp(N-1 downto 1));
                A_temp <= (sum_temp & A_temp(N-1 downto 1));
            end if;
    end process;

    sum <= A_temp;

end Behavioral;