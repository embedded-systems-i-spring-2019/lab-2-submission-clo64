-- Charles Owen
-- Embedded Systems
-- Lab 2
-- Full Adder Test Bench

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Full_Adder_TB is
--  Port ( );
end Full_Adder_TB;

architecture Behavioral of Full_Adder_TB is

signal tb_a_buttons : std_logic_vector(3 downto 0) := (others => '0');
signal tb_b_buttons : std_logic_vector(3 downto 0) := (others => '0');
signal tb_outputs   : std_logic_vector(3 downto 0) := (others => '0');
signal tb_c_in      : std_logic := '0';

component ripple_adder
        Port(
        
        A, B            : in std_logic_vector(3 downto 0);
        S_out           : out std_logic_vector(3 downto 0);
        C_in            : in std_logic;
        C_out           : out std_logic
           
        );
end component;

begin

add_test: process begin

wait for 100000ns;
tb_a_buttons <= "0001";
tb_b_buttons <= "0001";

wait for 100000ns;
tb_a_buttons <= "1001";
tb_b_buttons <= "0001";

wait for 100000ns;
tb_a_buttons <= "0011";
tb_b_buttons <= "0101";

wait for 100000ns;
tb_a_buttons <= "0011";
tb_b_buttons <= "0011";

end process;

dut: ripple_adder
     port map (
     
     A => tb_a_buttons,
     B => tb_b_buttons,
     S_out => tb_outputs,
     C_in => tb_c_in
     
     );
end Behavioral;
