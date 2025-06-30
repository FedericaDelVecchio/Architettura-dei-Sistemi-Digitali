library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sistema_B is
    Port (clock, reset, interconnessione : in std_logic);
end sistema_B;

architecture Behavioral of sistema_B is
    
    component MEM is
        Port ( 
            address : in STD_LOGIC_VECTOR(3 downto 0);
            data_in : in STD_LOGIC_VECTOR(7 downto 0);
            write : in STD_LOGIC;
            read : in STD_LOGIC;
            data_out : out STD_LOGIC_VECTOR(7 downto 0)
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
    
    component control_unit_B is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : out STD_LOGIC;
           load : out STD_LOGIC;
           read : out STD_LOGIC;
           RDA_B : in STD_LOGIC
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
    
    signal data, data_out : std_logic_vector(7 downto 0); -- data_ount non utilizzato
    signal address : std_logic_vector(3 downto 0); 
    signal enable, -- del contatore
        load, -- della memoria
        read: std_logic; -- della UART
    signal TXD, TBE, PE, FE, OE : std_logic; -- non usati
    signal DBIN, DBOUT : STD_LOGIC_VECTOR(7 DOWNTO 0); -- DBIN non usati
    signal RDA_B : std_logic :='0';
    
begin
    mem_data : MEM port map(address => address, data_in => data, write => load, read => '0', data_out => data_out);
    
    cont_B : cont_mod_8 port map(clock => enable, reset => reset, count => address);
    
    contr_unit_B : control_unit_B port map(clock => clock, reset => reset, read => read, enable => enable, load => load, RDA_B => RDA_B);
    
    UART_B : Rs232RefComp port map(
        TXD => TXD, 
        RXD => interconnessione, 
        CLK => clock, 
        DBIN => "00000000", 
        DBOUT => data, 
        RDA => RDA_B, 
        TBE => TBE, 
        RD => read, 
        WR => '0', 
        PE => PE, 
        FE => FE, 
        OE => OE, 
        RST => reset);

end Behavioral;
