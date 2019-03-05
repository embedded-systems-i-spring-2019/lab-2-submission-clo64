-- Charles Owen
-- Embedded Systems
-- Lab 2
-- ALU Tester

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity alu_tester is
      Port (
      
       clk           : in std_logic;
       sw, btn       : in std_logic_vector(3 downto 0);
       led           : out std_logic_vector(3 downto 0)
       
       );
end alu_tester;

architecture Behavioral of alu_tester is

signal dbnc_connection : std_logic_vector(3 downto 0);
signal led_temp        : std_logic_vector(3 downto 0);

component debounce_two is
        Port(
        btn, clk        : in std_logic;
        dbnc            : out std_logic
        
        );
end component;

component alu is
    Port(
    
        signal clk          : in std_logic;       
        signal data         : in std_logic_vector(3 downto 0);
        signal button       : in std_logic_vector(3 downto 0);
        signal alu_out      : out std_logic_vector(3 downto 0)
         
    );
end component;

begin

led <= led_temp;

b1: debounce_two
    Port map (
    
    clk => clk,
    btn => btn(0),
    dbnc => dbnc_connection(0)
    
    );
    
b2: debounce_two
    Port map (
    
    clk => clk,
    btn => btn(1),
    dbnc => dbnc_connection(1)
    
    );
    
b3: debounce_two
    Port map (
    
    clk => clk,
    btn => btn(2),
    dbnc => dbnc_connection(2)
    
    );
    
b4: debounce_two
    Port map (
    
    clk => clk,
    btn => btn(3),
    dbnc => dbnc_connection(3)
    
    );    
    
alunit: alu
     Port map(
     
     clk => clk,
     data => sw,
     button => dbnc_connection,
     alu_out => led_temp
     
     );    
    

end Behavioral;
