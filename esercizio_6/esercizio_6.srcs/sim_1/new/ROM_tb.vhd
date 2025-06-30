library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM_tb is
end ROM_tb;

architecture testbench of ROM_tb is
    signal address_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal d_out_tb   : STD_LOGIC_VECTOR(7 downto 0);

    component ROM
        port (
            address : in  STD_LOGIC_VECTOR(3 downto 0);
            d_out   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin
    uut : ROM
        port map (
            address => address_tb,
            d_out   => d_out_tb
        );

    stimulus : process
    begin
        wait for 10 ns;

        address_tb <= "0000";
        wait for 10 ns;

        address_tb <= "0010";
        wait for 10 ns;

        address_tb <= "1101";
        wait for 10 ns;

        address_tb <= "1011";
        wait for 10 ns;

        wait;
    end process stimulus;
end testbench;
