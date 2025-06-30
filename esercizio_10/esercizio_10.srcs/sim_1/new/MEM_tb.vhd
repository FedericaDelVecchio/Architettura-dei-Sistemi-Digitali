library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MEM_tb is
end MEM_tb;

architecture testbench of MEM_tb is
    signal address : std_logic_vector(3 downto 0);
    signal data_out, data_in : std_logic_vector(7 downto 0);
    signal write, read: std_logic := '0';

    constant CLOCK_PERIOD: time := 10 ns; 
    
begin
    dut : entity work.MEM
        port map(
            address => address,
            data_in => data_in,
            write => write,
            read => read,
            data_out => data_out
        );

    process
    begin
        while now < 2000 ns loop
            wait for CLOCK_PERIOD / 2;
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;
    end process;

    process
    begin
        write <= '1';
        address <= "0000";
        data_in <= "10101010";
        wait for 20 ns;

        write <= '0';
        wait for 20 ns;

        read <= '1';
        wait for 20 ns;
        read <= '0';
        wait for 20 ns;

        write <= '1';
        address <= "0001";
        data_in <= "11001100"; 
        wait for 20 ns;

        write <= '0';
        wait for 20 ns;

        read <= '1';
        wait for 20 ns;

        read <= '0';
        wait for 20 ns;

        write <= '1';
        address <= "0010";
        data_in <= "11110000"; 
        wait for 20 ns;

        write <= '0';
        wait for 20 ns;

        read <= '1';
        wait for 20 ns;

        read <= '0';
        wait for 20 ns;

        wait;
    end process;

end testbench;
