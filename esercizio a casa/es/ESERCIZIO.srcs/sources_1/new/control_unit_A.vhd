library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity control_unit_A is
    Port ( clock : in STD_LOGIC;
           start : in STD_LOGIC;
           reset : in STD_LOGIC;
           ack : in std_logic;
           req : out std_logic;
           address : in std_logic_vector(2 downto 0);
           enable_cont : out std_logic
           );
end control_unit_A;

architecture Behavioral of control_unit_A is

    type stato is (idle, Q1, Q2, Q3, Q4);   
    signal stato_corrente : stato := idle;
    
begin

process(clock)
    begin
        if rising_edge(clock) then
            if reset = '1' then
                stato_corrente <= idle;
            else
                case stato_corrente is
                   when idle => 
                      if(start='1') then 
                        stato_corrente <= Q1;
                      else 
                        stato_corrente <= idle;
                      end if;
                    
                   when Q1 => 
                       enable_cont <= '0';
                       stato_corrente <= Q2;
                   
                   when Q2 =>
                       req <= '1';
                       if(ack='0') then
                           stato_corrente <= Q2;
                       else stato_corrente <= Q3;
                       end if;
                       
                   when Q3 =>
                       req <= '0';
                       if(ack='1') then
                           stato_corrente <= Q3;
                       else 
                           stato_corrente <= Q4;
                       end if;
                       
                   when Q4 =>
                       if(address="111") then
                           stato_corrente <= idle;
                       else 
                          enable_cont <= '1';
                          stato_corrente <= Q1;
                       end if;
                end case;
            end if;
        end if;
    end process; 
  
end Behavioral;