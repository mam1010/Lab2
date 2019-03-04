----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2019 11:39:29 AM
-- Design Name: 
-- Module Name: alu_tester - rt1_structural
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

entity alu_tester is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           BTN : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in std_logic;
           C : out STD_LOGIC_VECTOR (3 downto 0));
end alu_tester;

architecture rt1_structural of alu_tester is
    component my_alu 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               x : in STD_LOGIC_VECTOR (3 downto 0);
               F : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component debounce
    Port ( btn : in STD_LOGIC;
               clk : in STD_LOGIC;
               dbnc : out STD_LOGIC);
    end component;
    
    signal buttons : std_logic_vector(3 downto 0);
    signal A_in : std_logic_vector(3 downto 0);
    signal B_in : std_logic_vector(3 downto 0);
    signal O_in : std_logic_vector(3 downto 0);
    
begin
    db1 : debounce
    port map(
        btn => BTN(0),
        clk => CLK,
        dbnc => buttons(0));
    
    db2 : debounce
    port map(
        btn => BTN(1),
        clk => CLK,
        dbnc => buttons(1));
    
    db3 : debounce
    port map(
        btn => BTN(2),
        clk => CLK,
        dbnc => buttons(2));
    
    db4 : debounce
    port map(
        btn => BTN(3),
        clk => CLK,
        dbnc => buttons(3));
    
    alu : my_alu
    port map(
        A => A_in,
        B => B_in,
        x => O_in,
        F => C);
    
    process(CLK)
    begin
        if(rising_edge(CLK)) then
            if(buttons(3) = '1') then
                A_in <= "0000";
                B_in <= "0000";
                O_in <= "0000";
            else
                if(buttons(0) = '1') then
                    B_in <= SW;
                end if;
                if(buttons(1) = '1') then
                    A_in <= SW;
                end if;
                if(buttons(2) = '1') then
                    O_in <= SW;
                end if;
            end if;
        end if;
    end process;

end rt1_structural;
