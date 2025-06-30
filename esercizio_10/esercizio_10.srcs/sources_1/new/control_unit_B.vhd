library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity control_unit_B is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : out STD_LOGIC;
           load : out STD_LOGIC;
           read : out STD_LOGIC;
           RDA_B : in STD_LOGIC
           );
end control_unit_B;

architecture Behavioral of control_unit_B is

    type state is (idle, s1, s2);
    signal current_state: state;

begin

    process(clock)
    begin
        if rising_edge(clock) then
            if reset = '1' then
                current_state <= idle;
            else
                case current_state is
                    when idle =>
                        enable <= '0';
                        if RDA_B = '1' then
                            read <= '1';
                            current_state <= s1;
                        else
                            current_state <= idle;
                        end if;

                    when s1 =>
                        load <= '1';
                        current_state <= s2;

                    when s2 =>
                        load <= '0';
                        read <= '0';
                        enable <= '1';
                        current_state <= idle;
                end case;
            end if;
        end if;
    end process;

end Behavioral;
