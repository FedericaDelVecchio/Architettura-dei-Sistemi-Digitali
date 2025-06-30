library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contatore_tb is
end contatore_tb;

architecture tb_architecture of contatore_tb is
    constant CLK_PERIOD : time := 10 ns;
    signal clk_tb : std_logic := '0';
    signal reset_tb : std_logic := '0'; 
    signal set_tb : std_logic := '0';
    signal init_count_tb : integer := 0; 
    signal count_tb : integer := 0;
    
    component contatore
        generic (
            MAX_VALUE : integer := 59
        );
        port (
            clk : in std_logic;
            reset : in std_logic;
            set : in std_logic;
            init_count : in integer range 0 to MAX_VALUE;
            count : out integer range 0 to MAX_VALUE
        );
    end component;

begin
    contatore_inst : contatore
        generic map (
            MAX_VALUE => 59
        )
        port map (
            clk => clk_tb,
            reset => reset_tb,
            set => set_tb,
            init_count => init_count_tb,
            count => count_tb
        );

    process
    begin
        while now < 1000 ns loop
            clk_tb <= not clk_tb;
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    process
    begin
        reset_tb <= '1';
        wait for 5 * CLK_PERIOD;
        reset_tb <= '0';
        
        wait for 10 * CLK_PERIOD;

        init_count_tb <= 12;
        set_tb <= '1';
        wait for CLK_PERIOD;
        set_tb <= '0';

        wait for 62*CLK_PERIOD;
        wait;
    end process;

end tb_architecture;
