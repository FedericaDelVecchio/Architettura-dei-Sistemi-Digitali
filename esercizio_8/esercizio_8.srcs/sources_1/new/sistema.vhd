library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sistema is -- complessivo
    Port (
        start, reset, clock : in std_logic ); -- clock è il segnale di tempificazione del sistema A (a 10 ns)
end sistema;

architecture Structural of sistema is

    component sistema_B is
      Port (
        clock : in std_logic;
        reset : in std_logic;
        req : in std_logic;
        ack : out std_logic;
        data : in std_logic_vector(3 downto 0));
    end component;

    component sistema_A is
      Port (
        clock : in std_logic;
        start : in std_logic;
        reset : in std_logic;
        req : out std_logic;
        ack : in std_logic;
        data : out std_logic_vector(3 downto 0));
    end component;
    
    signal ack, req : std_logic;
    signal data : std_logic_vector(3 downto 0);
    
    signal count : integer range 0 to 1 := 0;
    signal clk_B : STD_LOGIC := '0'; -- clock è il segnale di tempificazione del sistema B (da 16 ns)
    constant CLK_DIVISION_FACTOR : integer := 2; 
    constant COUNT_MAX : integer := CLK_DIVISION_FACTOR - 1;
    
begin

    sis_A : sistema_A port map (clock => clock, start => start, reset => reset, req => req, ack => ack, data => data);
    
    sis_B : sistema_B port map (clock => clk_B, reset => reset, req => req, ack => ack, data => data);
    
    process(clock, reset)
    begin
        if reset = '1' then
            count <= 0;
            clk_B <= '0';
        elsif rising_edge(clock) then
            if count = COUNT_MAX then
                count <= 0;
                clk_B <= not clk_B; 
            else
                count <= count + 1;
            end if;
        end if;
    end process;

end architecture Structural;
