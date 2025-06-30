library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity node_B is
  Port (
    clock : in std_logic;
    reset : in std_logic;
    req : in std_logic;
    ack : out std_logic;
    data1 : in std_logic_vector(3 downto 0);
    data2 : in std_logic_vector(3 downto 0));
end node_B;

architecture Structural of node_B is

    component serial_adder is
    generic (N : INTEGER:=4); 
    port(
        A: in STD_LOGIC_VECTOR (N-1 downto 0); 
        B: in STD_LOGIC_VECTOR (N-1 downto 0); 
        clock: in STD_LOGIC; 
        load: in STD_LOGIC; 
        sum: out STD_LOGIC_VECTOR(N-1 downto 0));
    end component;
    
    component MEM is
      generic (
        DATA_WIDTH : integer := 8; 
        DEPTH      : integer := 16;
        ADDR_WIDTH : integer := 4
      );
      Port (
        clk     : in STD_LOGIC;                      
        rst     : in STD_LOGIC;                      
        write   : in STD_LOGIC;                      
        read    : in STD_LOGIC;                      
        address : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0); 
        dataIn  : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        dataOut : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
      );
    end component;
    
    component counter is
      generic (
        WIDTH : integer := 8 
      );
      Port (
        clk    : in STD_LOGIC; 
        rst    : in STD_LOGIC;
        enable : in STD_LOGIC; 
        count  : out STD_LOGIC_VECTOR(WIDTH-1 downto 0)  
      );
    end component;
    
    component control_unit_B is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           en_count : out STD_LOGIC;
           load_reg : out STD_LOGIC;
           write_mem : out STD_LOGIC;
           req : in std_logic;
           ack : out std_logic);
    end component;
    
    signal load_reg, write_mem, en_count : std_logic;
    signal op1, op2, ris : std_logic_vector(3 downto 0);
    signal address : std_logic_vector(2 downto 0);
    
begin

    count: counter 
        generic map(
            WIDTH=>3
        ) port map(
            clk => clock,
            rst => reset,
            enable => en_count,
            count => address
        );
        
    ser_add : serial_adder 
        generic map(
            N=>4
        ) port map( 
            A => data1,
            B => data2,
            clock => clock,
            load => load_reg,
            sum => ris);
            
    m_e_m : MEM 
        generic map (
            DATA_WIDTH => 4,
            DEPTH => 8, 
            ADDR_WIDTH => 3
        ) port map (
              clk => clock,
              rst => reset,
              write => write_mem,
              read => '0',
              address => address,
              dataIn => ris,
              dataOut => open);
    
    cu_B : control_unit_B port map (
        clock => clock,
        reset => reset,
        en_count => en_count,
        load_reg => load_reg,
        write_mem => write_mem,
        req => req,
        ack => ack        
    );
end Structural;