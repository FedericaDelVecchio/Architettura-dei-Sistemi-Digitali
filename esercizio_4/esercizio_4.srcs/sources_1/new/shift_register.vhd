library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift_register is
    generic (
        N : integer := 8
    );
    port (
        clk      : in  std_logic;
        rst      : in  std_logic;
        dir      : in  std_logic; -- 0: destra, 1: sinistra
        Y        : in  std_logic_vector(1 downto 0); -- 00: load, 01: shifta di 1 posizione, 10: shifta di 2 posizioni
        din      : in  std_logic_vector(N-1 downto 0);
        dout     : out std_logic_vector(N-1 downto 0)
    );
end entity shift_register;

architecture Behavioral of shift_register is

    signal reg : std_logic_vector(N-1 downto 0);
    
begin
    process(clk, rst)
    begin
        if rst = '1' then
            reg <= (others => '0');
        elsif rising_edge(clk) then
            case Y is
                when "00" => -- load
                    reg <= din;
                when "01" => -- una posizione
                    case dir is
                        when '0' => reg <= '0' & reg(N-1 downto 1); -- destra
                        when '1' => reg <= reg(N-2 downto 0) & '0' ; -- sinistra
                        when others => reg <= (others=>'0');
                    end case;
                when "10" => -- due posizioni
                    case dir is
                        when '0' => reg <= "00" & reg(N-1 downto 2); -- destra
                        when '1' => reg <= reg(N-3 downto 0) & "00"; -- sinistra
                        when others => reg <= (others=>'0');
                    end case;
                when others =>
                    reg <= (others=>'0');
            end case;
        end if;
    end process;

    dout <= reg;
end architecture Behavioral;


architecture Structural of shift_register is

    component flip_flop_d 
    port ( clk    : in STD_LOGIC;
           reset  : in STD_LOGIC;
           d      : in STD_LOGIC;
           q      : out STD_LOGIC);
    end component;
    
    component mux_8_1 
    port ( 
        input_0 : in STD_LOGIC;
        input_1 : in STD_LOGIC;
        input_2 : in STD_LOGIC;
        input_3 : in STD_LOGIC;
        input_4 : in STD_LOGIC;
        input_5 : in STD_LOGIC;
        input_6 : in STD_LOGIC;
        input_7 : in STD_LOGIC;
        control : in STD_LOGIC_VECTOR(2 downto 0);
        output : out STD_LOGIC
    );
    end component;
    
    signal mux_out: std_logic_vector(N-1 downto 0) ;
    signal flip_flop_out: std_logic_vector(N-1 downto 0);
    signal ctr: std_logic_vector(2 downto 0);
    signal dir_new: std_logic;
    
begin
    ctr <= "101" when rst='1' else
           "000" when Y="00" else
           "001" when dir='0' and Y="01" else
           "010" when dir='1' and Y="01" else
           "011" when dir='0' and Y="10" else
           "100" when dir='1' and Y="10";

    flip_flop_gen: for i in 0 to N-1 generate
        flip_flop: flip_flop_d port map(
            clk => clk,
            reset => rst,
            d => mux_out(i),
            q => flip_flop_out(i)
        );
    end generate flip_flop_gen;
    
    mux_0: mux_8_1 port map(
        input_0 =>  din(0), -- caricamento
        input_1 => flip_flop_out(1), -- shift di una posizione a sinistra 
        input_2 => '0', -- shift di una posizione a destra 
        input_3 => flip_flop_out(2), -- shift di due posizioni a sinistra 
        input_4 => '0', -- shift di due posizioni a destra 
        input_5 => '0', -- reset
        input_6 => '0', -- non usato
        input_7 => '0', -- non usato
        control => ctr,
        output => mux_out(0)
    );
    
    mux_1: mux_8_1 port map(
        input_0 =>  din(1),
        input_1 => flip_flop_out(2),
        input_2 => flip_flop_out(0),
        input_3 => flip_flop_out(3),
        input_4 => '0',
        input_5 => '0',
        input_6 => '0', 
        input_7 => '0',
        control => ctr, 
        output => mux_out(1)
    );
    
    mux_N_1: mux_8_1 port map(
        input_0 =>  din(N-1),
        input_1 => '0',
        input_2 => flip_flop_out(N-2),
        input_3 => '0',
        input_4 => flip_flop_out(N-3),
        input_5 => '0',
        input_6 => '0', 
        input_7 => '0',
        control => ctr,
        output => mux_out(N-1)
    );
    
    mux_N_2: mux_8_1 port map(
        input_0 =>  din(N-2),
        input_1 => flip_flop_out(N-1),
        input_2 => flip_flop_out(N-3),
        input_3 => '0',
        input_4 => flip_flop_out(N-4),
        input_5 => '0',
        input_6 => '0', 
        input_7 => '0',
        control => ctr, 
        output => mux_out(N-2)
    );
    
    mux_gen: for i in 2 to N-3 generate
        mux_interni: mux_8_1 port map(
            input_0 =>  din(i),
            input_1 => flip_flop_out(i+1),
            input_2 => flip_flop_out(i-1),
            input_3 => flip_flop_out(i+2),
            input_4 => flip_flop_out(i-2),
            input_5 => '0',
            input_6 => '0', 
            input_7 => '0',
            control => ctr, 
            output => mux_out(i)
        );
    end generate mux_gen;

    dout <= flip_flop_out;
    
end Structural;


