-- Charles Owen
-- Embedded Systems
-- Lab 2
-- Adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
        Port(
        
            A, B, C_in  : in std_logic; -- Standard Inputs for the Adder
            C_out       : out std_logic; -- Carry out
            S_out       : out std_logic -- Sum output
        
        );
end adder;

architecture Behavioral of adder is

begin

S_out <= A xor B xor C_in; -- Logic for Sum

C_out <= (A and B) or (C_in and (A xor B)); -- Logic for carry out


end Behavioral;
