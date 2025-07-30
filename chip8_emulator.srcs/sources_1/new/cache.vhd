----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/20/2025 05:24:18 AM
-- Design Name: 
-- Module Name: cache - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cache is
  Port ( 
    clk: in std_logic;
    memory_addr: in std_logic_vector(15 downto 0); 
    memory_write: inout std_logic;
    memory_data_in: in std_logic_vector(7 downto 0); 
    memory_data_out_lsb: out std_logic_vector(7 downto 0);
    memory_data_out_msb: out std_logic_vector(7 downto 0);
    stack_addr: in std_logic_vector(15 downto 0);
    stack_write: inout std_logic;
    stack_data_in: in std_logic_vector(7 downto 0);
    stack_data_out: out std_logic_vector(7 downto 0)
  );
end cache;

architecture Behavioral of cache is
    type mem_cell is array (0 to 256) of std_logic_vector(7 downto 0);
    signal memory: mem_cell; 
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if memory_write = '1' then
                memory(to_integer(unsigned(memory_addr))) <= memory_data_in;
                memory_write <= '0';
            end if;
            if stack_write = '1' then
                memory(to_integer(unsigned(stack_addr))) <= stack_data_in;
                stack_write <= '0';
            end if;
            memory_data_out_lsb <=  memory(to_integer(unsigned(memory_addr)));
            memory_data_out_msb <=  memory(to_integer(unsigned(memory_addr)));
        end if;
         
    end process;


end Behavioral;
