library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity interconnect_16_4_board is
    Port (
        load_first_part : in  STD_LOGIC;
        load_second_part : in  STD_LOGIC;
        load_sel : in STD_LOGIC;
        reset : in STD_LOGIC;
        value14_in : in STD_LOGIC_VECTOR(13 downto 0);
        led : out STD_LOGIC_VECTOR(3 downto 0)        
    );
end interconnect_16_4_board;

architecture Structural of interconnect_16_4_board is
    component interconnect_16_4
        port (
            d_in  : in  STD_LOGIC_VECTOR(15 downto 0);
            s_in  : in  STD_LOGIC_VECTOR(3 downto 0);
            s_out : in  STD_LOGIC_VECTOR(1 downto 0);
            d_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal inter_out : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal inter_in : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal sel_in    : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal sel_out   : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

begin
    intconn_16_4 : interconnect_16_4
        port map (
            d_in  => inter_in,
            s_in  => sel_in,
            s_out => sel_out,
            d_out => inter_out
        );

    main : process (reset, load_sel, load_first_part, load_second_part)
    begin
        if reset = '1' then
            inter_in <= (others => '0');
        elsif load_sel = '1' then
            sel_in <= value14_in(11 downto 8);
            sel_out <= value14_in(13 downto 12);
        elsif load_first_part = '1' then
            inter_in(7 downto 0) <= value14_in(7 downto 0);
        elsif load_second_part = '1' then
            inter_in(15 downto 8) <= value14_in(7 downto 0);
        end if;
    END PROCESS;

    led <= inter_out;

end Structural;
