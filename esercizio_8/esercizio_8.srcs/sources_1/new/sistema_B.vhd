library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity sistema_B is
  Port (
    clock : in std_logic;
    reset : in std_logic;
    req : in std_logic;
    ack : out std_logic;
    data : in std_logic_vector(3 downto 0));
end sistema_B;

architecture Structural of sistema_B is
    
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
    
    component operando_x is
    Port (
        clock : in std_logic;
        reset : in std_logic;
        dato_in : in std_logic_vector(3 downto 0);
        dato_out : out std_logic_vector(3 downto 0)
    );
    end component;
    
    component sommatore is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component unita_controllo_B is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           load : out STD_LOGIC;
           write : out STD_LOGIC;
           enable : out STD_LOGIC;
           req : in std_logic;
           ack : out std_logic);
    end component;

    component memoria is
        Port ( 
            reset : in STD_LOGIC;
            clock : in STD_LOGIC;
            address : in STD_LOGIC_VECTOR (3 downto 0);
            data_in : in STD_LOGIC_VECTOR (3 downto 0);
            write : in STD_LOGIC;
            load : in STD_LOGIC;
            data_out : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal load, write : std_logic := '0';
    signal count : std_logic_vector(3 downto 0) := (others=>'0');
    signal enable : std_logic := '0';
    signal conteggio : integer := 0;
    signal op_x, op_y, sum: std_logic_vector(3 downto 0) := (others=>'0');
    signal clock_mem : std_logic := '0';

begin
    control_unit_B : unita_controllo_B port map (clock => clock, enable => enable, reset => reset, load => load, write => write, req => req, ack => ack);
    
    cont_B : cont_mod_16 port map(clock => enable, reset => reset, count => conteggio);
    
    count <= std_logic_vector(to_unsigned(conteggio, count'length));
    
    operand_x : operando_x port map(clock => load, reset => reset, dato_in => data, dato_out => op_x);
    
    somm : sommatore port map (A => op_x, B => op_y, sum => sum);
    
    clock_mem <= enable or load;
    
    mem : memoria port map(reset => reset, clock => clock_mem, address => count, data_in => sum, write => write, load => load, data_out => op_y);
end Structural;
