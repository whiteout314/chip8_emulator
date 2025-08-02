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

entity cache is
  Port ( 
    clk: in std_logic;
    memory_addr: inout std_logic_vector(15 downto 0); 
    memory_write: inout std_logic;
    memory_data_in: in std_logic_vector(7 downto 0); 
    memory_data_out_lsb: inout std_logic_vector(7 downto 0);
    memory_data_out_msb: inout std_logic_vector(7 downto 0);
    stack_addr: in std_logic_vector(15 downto 0);
    stack_write: inout std_logic;
    stack_data_in: inout std_logic_vector(7 downto 0);
    stack_data_out: inout std_logic_vector(7 downto 0)
  );
end cache;

architecture Behavioral of cache is
    type mem_cell is array (0 to 1000) of std_logic_vector(7 downto 0);
    signal memory: mem_cell := (
    --- Load V0, V6
    0 => x"80", 1 => x"60",

    -- Load I with 0x1FF
    -- Load I with 0x1FF
    2 => x"A1", 3 => x"FF",

    4 => x"70", 5 => x"22",
    
    -- Jump to wait loop (address 0x212)
    6 => x"10", 7 => x"00",
    others => (others => '0')  -- Fill rest with zeros; 
    );
    
    
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
            memory_data_out_lsb <=  memory(to_integer(unsigned(memory_addr) + 2));
            memory_data_out_msb <=  memory(to_integer(unsigned(memory_addr)));
            memory_addr <= memory_addr;
        end if;
         
    end process;


end Behavioral;
