library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity unita_controllo_B is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : out STD_LOGIC;
           load : out STD_LOGIC;
           write : out STD_LOGIC;
           req : in std_logic;
           ack : out std_logic);
end unita_controllo_B;

architecture Behavioral of unita_controllo_B is

    type state is (idle, s1, s2, s3, s4);
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
                        load <= '0';
                        if req = '1' then
                            current_state <= s1;
                        else
                            current_state <= idle;
                        end if;

                    when s1 =>
                        load <= '1';
                        enable <= '0';
                        current_state <= s2;

                    when s2 =>
                        load <= '0';
                        write <= '1';
                        current_state <= s3;

                    when s3 =>
                        write <= '0';
                        enable <= '1';
                        ack <= '1';
                        current_state <= s4;

                    when s4 =>
                        enable <= '0';
                        if req = '1' then
                            current_state <= idle;
                        else
                            ack <= '0';
                            current_state <= idle;
                        end if;
                end case;
            end if;
        end if;
    end process;

end Behavioral;
