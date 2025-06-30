library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity node_A is
   Port (  clock : in STD_LOGIC;
           start : in STD_LOGIC;
           reset : in STD_LOGIC;
           ack : in std_logic;
           req : out std_logic;
           data1 : out std_logic_vector(3 downto 0);
           data2 : out std_logic_vector(3 downto 0) );
end node_A;

architecture Behavioral of node_A is
    component ROM1 is
      generic (
        DATA_WIDTH    : integer := 8;  
        DEPTH         : integer := 16; 
        ADDRESS_WIDTH : integer := 4  
      );
      Port (
        address : in STD_LOGIC_VECTOR(ADDRESS_WIDTH-1 downto 0);
        dataOut : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
      );
    end component;
    
    component ROM2 is
      generic (
        DATA_WIDTH    : integer := 8; 
        DEPTH         : integer := 16; 
        ADDRESS_WIDTH : integer := 4 
      );
      Port (
        address : in STD_LOGIC_VECTOR(ADDRESS_WIDTH-1 downto 0);
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
    
    component control_unit_A is
        Port ( clock : in STD_LOGIC;
               start : in STD_LOGIC;
               reset : in STD_LOGIC;
               ack : in std_logic;
               req : out std_logic;
               address : in std_logic_vector(2 downto 0);
               enable_cont : out std_logic
               );
    end component;
    
    signal address : std_logic_vector(2 downto 0);
    signal enable_count : std_logic;
begin
    cont_addr: counter 
          generic map (
            WIDTH => 3 
          )
          port map(
            clk => clock,
            rst => reset,
            enable => enable_count, 
            count => address 
          );
          
    mem1 : ROM1 
        generic map (
            DATA_WIDTH => 4,
            DEPTH => 8, 
            ADDRESS_WIDTH => 3  
        ) port map (
            address => address,
            dataOut => data1
        );
        
    mem2 : ROM2 
        generic map (
            DATA_WIDTH => 4,
            DEPTH => 8, 
            ADDRESS_WIDTH => 3  
        ) port map (
            address => address,
            dataOut => data2
        );
    
    cu_A : control_unit_A
        port map ( 
            clock => clock,
            start => start,
            reset => reset,
            ack => ack,
            req => req,
            address => address,
            enable_cont => enable_count
       );
   
end Behavioral;