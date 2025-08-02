----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/30/2025 12:45:23 AM
-- Design Name: 
-- Module Name: system - Behavioral
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

entity system is
   Port(
        clk: in std_logic;
        input: in std_logic;
        PC_out: out std_logic_vector(3 downto 0)
   );
end system;

architecture Behavioral of system is
    
    
    component core 
        port (
            clk: in std_logic;
            input: in std_logic;
            PC: inout std_logic_vector(3 downto 0)
           
        );
    end component;
    signal PC: std_logic_vector(3 downto 0);
begin
    output: process(clk)
    begin
        if rising_edge(clk) then
        if input = '1' then
            PC_out <= PC;
        end if;
        end if;
    end process;
    processor: core
        port map(
            clk => clk,
            input => input,
            PC => PC
        );
end Behavioral;
