-- Charles Owen
-- Embedded Systems
-- Lab 2
-- Ripple Adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ripple_adder is
        Port(
        
        A, B            : in std_logic_vector(3 downto 0); -- A and B input bundles
        S_out           : out std_logic_vector(3 downto 0); -- Sum output signals
        C_in            : in std_logic; -- Carry in value
        C_out           : out std_logic -- Carry out value
           
        );
end ripple_adder;

architecture Behavioral of ripple_adder is

signal A_inputs     : std_logic_vector(3 downto 0) := (others => '0'); -- Intermediate Signals, initialized to 0
signal B_inputs     : std_logic_vector(3 downto 0) := (others => '0');
signal C_input      : std_logic_vector(3 downto 0) := (others => '0'); -- Carry in intermediate
signal C_output     : std_logic_vector(3 downto 0) := (others => '0'); -- Carry out intermediate

component adder
        Port(
        
            A, B, C_in  : in std_logic; -- Standard Inputs for the Adder
            C_out       : out std_logic; -- Carry out
            S_out       : out std_logic -- Sum output
        
        );
 end component;
 
begin

-- Instantiate the 3 one bit full adders

adder_3: adder
         port map(
         A => A_inputs(3),
         B => B_inputs(3),
         C_in => C_input(3),
         S_out => S_out(3),
         C_out => C_output(3)
         
         );
         
         
adder_2: adder
         port map(
         A => A_inputs(2),
         B => B_inputs(2),
         C_in => C_input(2),
         S_out => S_out(2),
         C_out => C_output(2)
         
         );
         
adder_1: adder
         port map(
         A => A_inputs(1),
         B => B_inputs(1),
         C_in => C_input(1),
         S_out => S_out(1),
         C_out => C_output(1)
         
         );
         
adder_0: adder
         port map(
         A => A_inputs(0),
         B => B_inputs(0),
         C_in => C_input(0),
         S_out => S_out(0),
         C_out => C_output(0)
         
         );
         
-- Connect componenets
         
C_input(0) <= C_in; -- The carry in to unit 0 takes C_in from user
C_input(1) <= C_output(0); -- Carry out from unit 0 into unit 1
C_input(2) <= C_output(1); -- Carry out from unit 1 into unit 2
C_input(3) <= C_output(2); -- Carry out from unit 2 into unit 3
C_out <= C_output(3); -- Carry our to user from unit 3
A_inputs <= A; -- connext User input A to units 0 through 3
B_inputs <= B; -- connect User unput B to units 0 through 3


end Behavioral;
