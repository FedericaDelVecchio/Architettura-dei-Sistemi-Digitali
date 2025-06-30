library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity control_unit_B is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           en_count : out STD_LOGIC;
           load_reg : out STD_LOGIC;
           write_mem : out STD_LOGIC;
           req : in std_logic;
           ack : out std_logic);
end control_unit_B;

architecture Behavioral of control_unit_B is

    type state is (idle, Q1, Q2, Q3, Q4, Q5);
    signal current_state: state;

begin

    process(clock)
    variable wait_sum : integer := 0;
    begin
        if rising_edge(clock) then
            if reset = '1' then
                current_state <= idle;
            else
                case current_state is
                    when idle =>
                        load_reg <= '0';
                        if req = '1' then
                            current_state <= Q1;
                        else
                            current_state <= idle;
                        end if;

                    when Q1 =>
                        load_reg <= '1';
                        current_state <= Q2;

                    when Q2 =>
                        load_reg <= '0';
                        wait_sum := 0;
                        current_state <= Q3;
                    
                    when Q3 =>
                        if(wait_sum=2) then
                            write_mem <='1';
                            current_state <= Q4;
                        else 
                            wait_sum := wait_sum +1;
                            current_state <= Q3;
                        end if;
                        
                    when Q4 =>
                        write_mem <= '0';
                        en_count <= '1';
                        ack <= '1';
                        current_state <= Q5;

                    when Q5 =>
                        en_count <= '0';
                        if req = '1' then
                            ack <= '0';
                            current_state <= idle;
                        else
                            current_state <= Q5;
                        end if;
                end case;
            end if;
        end if;
    end process;

end Behavioral;
