----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/22/2025 12:17:03 AM
-- Design Name: 
-- Module Name: flag - Behavioral
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

entity flag is
  Port ( 
    clk: in std_logic;
    flag_write: in std_logic;
    flag_status_in: in std_logic;
    flag_status_out: out std_logic
  );
end flag;

architecture Behavioral of flag is
    signal flag: std_logic := '0';
begin
    process(clk)
    begin 
        if rising_edge(clk) then 
            if flag_write = '1' then
                flag <= flag_status_in;
                flag_write <= '0';
            end if;
            
            flag_status_out <= flag;
        end if;
     end process;
end Behavioral;
