-- Charles Owen
-- Embedded Systems
-- Lab 2
-- ALU

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port(
    
        signal clk          : in std_logic;
        signal data         : in std_logic_vector(3 downto 0);
        signal button       : in std_logic_vector(3 downto 0);
        signal alu_out      : out std_logic_vector(3 downto 0)
         
    );
end alu;

architecture Behavioral of alu is

-- intermediate signals

signal B_in, A_in, opcode_in : std_logic_vector(3 downto 0);

begin

-- sperate process for button press actions
button_process: process (clk)
                begin
                
                if (button(0) = '1') then -- load data into B
         
                 B_in <= data;
            
                end if;
         
                if (button(1) = '1') then -- load data into A
         
                 A_in <= data;
         
                end if;
                
                if (button(2) = '1') then -- load operational code
        
                 opcode_in <= data;
           
                end if;
                
                if (button(3) = '1') then -- clear all
         
                 A_in <= "0000";
                 B_in <= "0000";
                 opcode_in <= "0000";
            
                end if;
                
                end process;

alu_proc: process (clk)
          begin
          
          case opcode_in is -- Case Statements per design brief
          
          when "0000" => alu_out <= std_logic_vector(unsigned(A_in) + unsigned(B_in));
          
          when "0001" => alu_out <= std_logic_vector(unsigned(A_in) - unsigned(B_in));
          
          when "0010" => alu_out <= std_logic_vector(unsigned(A_in) + 1);
          
          when "0011" => alu_out <= std_logic_vector(unsigned(A_in) - 1);
          
          when "0100" => alu_out <= std_logic_vector(0 - unsigned(A_in));
          
          when "0101" =>
            if(A_in > B_in) then
                alu_out <= "0001";
            else
                alu_out <= "0000";
            end if;
            
          when "0110" => alu_out <= std_logic_vector(shift_left(unsigned(A_in), 1));
          
          when "0111" => alu_out <= std_logic_vector(shift_right(unsigned(A_in), 1));
          
          when "1000" => alu_out <= std_logic_vector(shift_right(signed(A_in), 1));
          
          when "1001" => alu_out <= (not A_in);
          
          when "1010" => alu_out <= (A_in and B_in);
          
          when "1011" => alu_out <= (A_in or B_in);
          
          when "1100" => alu_out <= (A_in xor B_in);
          
          when "1101" => alu_out <= (A_in xnor B_in);
          
          when "1110" => alu_out <= (A_in nand B_in);
          
          when "1111" => alu_out <= (A_in nor B_in);
          
          when others => alu_out <= "0000";
          
          end case;
          
          end process;

end Behavioral;
