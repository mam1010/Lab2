----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 10:03:00 AM
-- Design Name: 
-- Module Name: ripple_adder - rt1_structural
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ripple_adder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end ripple_adder;

architecture rt1_structural of ripple_adder is
    component adder
    port(
        a, b, c_in : in std_logic;
        s : out STD_LOGIC;
        c_out : out STD_LOGIC
    );
    end component;
    
    signal c1 : std_logic;
    signal c2 : std_logic;
    signal c3 : std_logic;
    
begin
    fa1 : adder
    port map(
        a => A(0),
        b => B(0),
        c_in => C_in,
        s => S(0),
        c_out => c1);
    
    fa2 : adder
    port map(
        a => A(1),
        b => B(1),
        c_in => c1,
        s => S(1),
        c_out => c2
        );
    
    fa3 : adder
    port map(
        a => A(2),
        b => B(2),
        c_in => c2,
        s => S(2),
        c_out => c3);
            
    fa4 : adder
    port map(
        a => A(3),
        b => B(3),
        c_in => c3,
        s => S(3),
        c_out => C_out);
end rt1_structural;
