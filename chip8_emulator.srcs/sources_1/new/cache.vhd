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
    stack_data_in: in std_logic_vector(7 downto 0);
    stack_data_out: out std_logic_vector(7 downto 0)
  );
end cache;

architecture Behavioral of cache is
    type mem_cell is array (0 to 1000) of std_logic_vector(7 downto 0);
    signal memory: mem_cell := (
    --- Load V0, V6
    524 => x"80", 525 => x"60",

    -- Load I with 0x1FF
    -- Load I with 0x1FF
    526 => x"A1", 527 => x"FF",

    -- Store V0 at memory[I]
    528 => x"F0", 529 => x"55",

    -- Draw 1-byte sprite at (V0, V0)
    530 => x"D0", 531 => x"01",

    -- Load V2 with delay timer
    532 => x"F2", 533 => x"07",

    -- Skip next if V2 == 0
    534 => x"32", 535 => x"00",

    -- Jump to wait loop (address 0x212)
    536 => x"12", 537 => x"12",

    -- Jump to loop start (address 0x204)
    538 => x"12", 539 => x"04",
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
            memory_data_out_lsb <=  memory(to_integer(unsigned(memory_addr)));
            memory_data_out_msb <=  memory(to_integer(unsigned(memory_addr)));
        end if;
         
    end process;


end Behavioral;
