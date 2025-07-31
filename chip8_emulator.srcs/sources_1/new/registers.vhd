----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2025 12:33:03 AM
-- Design Name: 
-- Module Name: registers - Behavioral
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

entity registers is
--  Port ( )
    Port (
        clk: in std_logic;
        RA_write: inout std_logic;
        RA_data_in: in std_logic_vector (7 downto 0); 
        RA_data_out: out std_logic_vector (7 downto 0); 
        RA_addr: in std_logic_vector(3 downto 0);
        RB_write: inout std_logic;
        RB_data_in: in std_logic_vector (7 downto 0);
        RB_data_out: out std_logic_vector(7 downto 0);
        RB_addr: in std_logic_vector (3 downto 0)
    );
end registers;

architecture Behavioral of registers is
    type register_arr is array (0 to 14) of std_logic_vector (7 downto 0);
    signal VX: register_arr;
begin
    process(clk) 
    begin 
        if rising_edge(clk) then
            if RA_write = '1' then 
                VX(to_integer(unsigned(RA_addr))) <= RA_data_in;
                RA_write <= '0';
            elsif RB_write = '1' then 
                VX(to_integer(unsigned(RB_addr))) <= RB_data_in;
                RB_write <= '0';
            end if;
            
            RA_data_out <= VX(to_integer(unsigned(RA_addr))); 
            RB_data_out <= VX(to_integer(unsigned(RB_addr)));
        end if;
        
    end process;
end Behavioral;
