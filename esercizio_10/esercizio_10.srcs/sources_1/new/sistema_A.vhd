library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sistema_A is
    Port (clock, start, reset: in std_logic;
        interconnessione : out std_logic
     );
end sistema_A;

architecture Behavioral of sistema_A is
    
    component ROM is port(
            address : in  std_logic_vector(3 downto 0);
            d_out    : out std_logic_vector(7 downto 0)
        );
    end component;
    
    component cont_mod_8 is
    generic (
        MAX_VALUE : integer := 7
    );
    port (
        clock : in std_logic;
        reset : in std_logic;
        count : out std_logic_vector(3 downto 0) 
    );
    end component;
    
    component Rs232RefComp is
    Port ( 
		TXD 	: out std_logic  	:= '1';
    	RXD 	: in  std_logic;					
    	CLK 	: in  std_logic;					--Master Clock
		DBIN 	: in  std_logic_vector (7 downto 0);--Data Bus in
		DBOUT : out std_logic_vector (7 downto 0);	--Data Bus out
		RDA	: inout std_logic;						--Read Data Available(1 quando il dato è disponibile nel registro rdReg)
		TBE	: inout std_logic 	:= '1';				--Transfer Bus Empty(1 quando il dato da inviare è stato caricato nello shift register)
		RD		: in  std_logic;					--Read Strobe(se 1 significa "leggi" --> fa abbassare RDA)
		WR		: in  std_logic;					--Write Strobe(se 1 significa "scrivi" --> fa abbassare TBE)
		PE		: out std_logic;					--Parity Error Flag
		FE		: out std_logic;					--Frame Error Flag
		OE		: out std_logic;					--Overwrite Error Flag
		RST		: in  std_logic	:= '0');			--Master Reset
    end component;
    
    component control_unit_A is
    Port ( clock : in STD_LOGIC;
           start : in STD_LOGIC;
           reset : in STD_LOGIC;
           write : out STD_LOGIC;
           enable : out STD_LOGIC;
           count : in STD_LOGIC_VECTOR(3 downto 0);
           TBE_A : inout STD_LOGIC
     );
    end component;
    
    signal address :  std_logic_vector(3 downto 0) := (others=>'0');
    signal write, -- della UART 
        TBE_A,
        enable : std_logic; -- del contatore
    signal data, DBIN, DBOUT : std_logic_vector(7 downto 0); -- DBOUT non usato
    signal RDA, PE, FE, OE : std_logic :='0'; -- non usati
    
begin
    mem_rom : ROM port map (address => address, d_out => data);
    
    cont_A : cont_mod_8 port map(clock => enable, reset => reset, count => address);
    
    contr_unit_A : control_unit_A port map(clock => clock, 
        start => start, 
        reset => reset, 
        write => write, 
        enable => enable, 
        count => address, 
        TBE_A => TBE_A);
    
    UART_A : Rs232RefComp port map(
         TXD => interconnessione,
         RXD => '0', 
         CLK => clock, 
         DBIN => data, 
         DBOUT => DBOUT, 
         RDA => RDA,
         TBE => TBE_A, 
         RD => '0', 
         WR => write, 
         PE => PE, 
         FE => FE, 
         OE => OE, 
         RST => reset);

end Behavioral;
