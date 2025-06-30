library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity riconoscitore is
	port( i: in std_logic;
		  RST, CLK: in std_logic;
		  M : in std_logic;
		  Y: out std_logic
	);
end riconoscitore;

architecture Behavioral of riconoscitore is

type stato is (S0, S1, S2, S3, S4);

signal stato_corrente : stato := S0;
signal stato_prossimo : stato;

begin

stato_uscita: process(stato_corrente, i)
	begin
	   if(M='1') then
	   case stato_corrente is
			when S0 =>
				if( i = '0' ) then
					stato_prossimo <= S0;
					Y <= '0';
				else 
					stato_prossimo <= S1;
					Y <= '0';
				end if;
			when S1 =>
				if( i = '0' ) then
					stato_prossimo <= S2;
					Y <= '0';
				else
					stato_prossimo <= S1;
					Y <= '0';		
				end if;
			when S2 =>
				if( i = '0' ) then
					stato_prossimo <= S0;
					Y <= '0';
				else
					stato_prossimo <= S0;
					Y <= '1';
				end if;
			when others => 
			        stato_prossimo <= S0;
					Y <= '0';	
		end case;
		end if;
		
		if(M='0') then
	    case stato_corrente is
			when S0 =>
				if( i = '0' ) then
					stato_prossimo <= S1;
					Y <= '0';
				else 
					stato_prossimo <= S2;
					Y <= '0';
				end if;
			when S1 =>
				stato_prossimo <= S3;
				Y <= '0';
			when S3 =>
				stato_prossimo <= S0;
				Y <= '0';
			when S2 =>
				if( i = '0' ) then
					stato_prossimo <= S4;
					Y <= '0';
				else
					stato_prossimo <= S3;
					Y <= '0';
				end if;
			when S4 =>
				if( i = '0' ) then
					stato_prossimo <= S0;
					Y <= '0';
				else
					stato_prossimo <= S0;
					Y <= '1';
				end if;
			when others => stato_prossimo <= S0;
					Y <= '0';		
		end case;
		end if;
end process;

mem: process (CLK)
begin
	if( CLK'event and CLK = '1' ) then
		if( RST = '1') then
	       stato_corrente <= S0;
	    else
	       stato_corrente <= stato_prossimo;
	    end if;
   end if;
end process;

end Behavioral;