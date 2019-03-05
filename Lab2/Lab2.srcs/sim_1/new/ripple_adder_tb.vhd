----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 10:30:30 AM
-- Design Name: 
-- Module Name: ripple_adder_tb - testbench
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

entity ripple_adder_tb is
--  Port ( );
end ripple_adder_tb;

architecture testbench of ripple_adder_tb is

    signal tb_A : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_B : std_logic_vector(3 downto 0) := (others => '0');
    signal tb_C_in : std_logic := '0';
    signal tb_S : std_logic_vector(3 downto 0);
    signal tb_C_out : std_logic;
    signal counterA : std_logic_vector(3 downto 0) := (others => '0');
    signal counterB : std_logic_vector(3 downto 0) := (others => '0');
    
    component ripple_adder is
		port (
		 A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         C_in : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR (3 downto 0);
         C_out : out STD_LOGIC
	);
	end component;
begin
    input_gen_proc: process
    begin
        counterA <= "0000";
        counterB <= "0000";
        tb_C_in <= '0';
        for item in 1 to 16 loop 
            for item in 1 to 16 loop
                wait for 4 ns;
                tb_A <= counterA;
                counterA <= std_logic_vector(unsigned(counterA) + 1);
            end loop;
            tb_B <= counterB;
            counterB <= std_logic_vector(unsigned(counterB) + 1);
        end loop;
        
        counterA <= "0000";
        counterB <= "0000";
        tb_C_in <= '1';
        for item in 1 to 16 loop 
            for item in 1 to 16 loop
                wait for 4 ns;
                tb_A <= counterA;
                counterA <= std_logic_vector(unsigned(counterA) + 1);
            end loop;
            tb_B <= counterB;
            counterB <= std_logic_vector(unsigned(counterB) + 1);
        end loop;
    end process input_gen_proc;
    
    
        
    dut : ripple_adder
    port map (
        A => tb_A,
        B => tb_B,
        C_in => tb_C_in,
        S => tb_S,
        C_out => tb_C_out
    );
end testbench;
