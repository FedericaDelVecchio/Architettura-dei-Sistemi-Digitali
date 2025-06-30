library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CU is port (
      start : in std_logic;
      reset: in std_logic;
      clk : in std_logic;
      output : out std_logic_vector(3 downto 0)
      );
end CU;

architecture Behavioral of CU is
    
    component ROM is
    port (
        clk     : in  std_logic;
        read    : in  std_logic;
        address : in  std_logic_vector(3 downto 0);
        d_out   : out std_logic_vector(7 downto 0)
    );
    end component;
    
    component M is port(
        x : in  std_logic_vector(7 downto 0);
        y : out std_logic_vector(3 downto 0)
    );
    end component;
    
    component MEM is
    port (
        clk     : in  std_logic;
        address : in  std_logic_vector(3 downto 0);
        d_in    : in  std_logic_vector(3 downto 0);
        write   : in  std_logic;
        d_out   : out std_logic_vector(3 downto 0)
    );
    end component;
    
    component cont_mod_16  
    port (
        clk     : in  std_logic;
        rst     : in  std_logic;
        enable  : in  std_logic;
        count   : out std_logic_vector(3 downto 0)
    );
    end component;
    
    signal read_ROM : std_logic :='0';
    signal en_cont : std_logic :='0';
    signal write_MEM : std_logic :='0';
    signal address : std_logic_vector(3 downto 0) :=(others=>'0');
    signal ROM_out : std_logic_vector(7 downto 0) :=(others=>'0'); 
    signal M_out : std_logic_vector(3 downto 0) :=(others=>'0');
    
    type stato is (S0,S1,S2);
    signal stato_corrente : stato := S0;
    signal stato_prossimo : stato;
    
    
begin
    mem_rom: ROM port map(
        clk => clk,
        read => read_ROM,
        address => address,
        d_out => ROM_out
    );
    
    machine_m: M port map(
        x => ROM_out,
        y => M_out
    );
    
    mem_mem: MEM port map(
        clk => clk,
        address => address,
        d_in => M_out,
        write => write_MEM,
        d_out => output
    );
    
    contatore: cont_mod_16
        port map (
            clk => clk,
            rst => reset,
            enable => en_cont,
            count => address);
    
    process_1 : process(stato_corrente,start,reset)
    begin
        case stato_corrente is
        
            when S0 =>
                en_cont <= '0';
                read_ROM <= '0';
                write_MEM <= '0';
                if reset='1' then 
                    stato_prossimo <= S0;
                elsif(start='1') then
                    stato_prossimo <= S1;
                else stato_prossimo <= S0;
                end if;
                
            when S1 =>
                 if(reset='1') then --
                    stato_prossimo <= S0;
                 else en_cont <= '1';
                    read_ROM <= '1';
                    stato_prossimo <= S2;     
                 end if;    
                        
            when S2 =>
                write_MEM <= '1';
                if(reset='1') then --
                    stato_prossimo <= S0;
                else stato_prossimo <= S1;
                end if;
        end case;
    end process;
    
    
    process_2 : process(clk)
    begin
        if rising_edge(clk) then
            stato_corrente <= stato_prossimo;
        end if;
    end process;
end Behavioral;
