----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 10:28:39 AM
-- Design Name: 
-- Module Name: my_alu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           x : in STD_LOGIC_VECTOR (3 downto 0);
           F : out STD_LOGIC_VECTOR (3 downto 0));
end my_alu;

architecture Behavioral of my_alu is

begin
    process(A, B, X)
    begin
        case x is
            when "0000" => F <= std_logic_vector(unsigned(A) + unsigned(B));
            when "0001" => F <= std_logic_vector(unsigned(A) - unsigned(B));
            when "0010" => F <= std_logic_vector(unsigned(A) + 1);
            when "0011" => F <= std_logic_vector(unsigned(A) - 1);
            when "0100" => F <= std_logic_vector(0 - unsigned(A));
            when "0101" => 
                if( unsigned(A) >= unsigned(B)) then 
                    F <= "0001"; 
                else 
                    F <= "0000"; 
                end if;
            when "0110" => F <= std_logic_vector(shift_left(unsigned(A), 1));
            when "0111" => F <= std_logic_vector(shift_right(unsigned(A), 1));
            when "1000" => F <= std_logic_vector(shift_right(signed(A), 1));
            when "1001" => F <= not A;
            when "1010" => F <= A and B;
            when "1011" => F <= A or B;
            when "1100" => F <= A xor B;
            when "1101" => F <= A xnor B;
            when "1110" => F <= A nand B;
            when "1111" => F <= A nor B;
        end case;
    end process;
end Behavioral;
