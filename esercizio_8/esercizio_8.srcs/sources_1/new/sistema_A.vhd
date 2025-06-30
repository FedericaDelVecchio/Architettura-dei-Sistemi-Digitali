library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity sistema_A is
  Port (
    clock : in std_logic;
    start : in std_logic;
    reset : in std_logic;
    req : out std_logic;
    ack : in std_logic;
    data : out std_logic_vector(3 downto 0));
end sistema_A;

architecture Behavioral of sistema_A is
    component ROM is port ( 
        clock : in STD_LOGIC;
        reset : in STD_LOGIC;
        read : in STD_LOGIC;
        address : in STD_LOGIC_VECTOR(3 downto 0);
        data : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    component cont_mod_16 is
    generic (
        MAX_VALUE : integer := 15
    );
    port (
        clock : in std_logic;
        reset : in std_logic;
        count : out integer range 0 to MAX_VALUE
    );
    end component;
    
    component unita_controllo_A is
    Port ( clock : in STD_LOGIC;
           start : in STD_LOGIC;
           read : out STD_LOGIC;
           reset : in STD_LOGIC;
           enable : out STD_LOGIC;
           count : in STD_LOGIC_VECTOR(3 downto 0);
           req : out std_logic;
           ack : in std_logic);
    end component;
    
    signal count : std_logic_vector(3 downto 0) := (others=>'0');
    signal enable : std_logic := '0';
    signal read : std_logic := '0';
    signal conteggio : integer := 0;
    
begin
    mem_rom : ROM port map (clock => clock, reset => reset, read => read, address => count, data => data);
    
    cont : cont_mod_16 port map(clock => enable, reset => reset, count => conteggio);
    
    count <= std_logic_vector(to_unsigned(conteggio, count'length));
    
    control_unit : unita_controllo_A port map (clock => clock, read => read, start => start, reset => reset, enable => enable, count => count, req => req, ack => ack);
     
end Behavioral;
