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
        vid_active_video: out std_logic;
        vid_data: out std_logic_vector(7 downto 0);
        vid_hsync: out std_logic;
        vid_vsync: out std_logic;
        vid_locked: out std_logic
   );
end system;

architecture Behavioral of system is
    component core 
        port (
            clk: in std_logic;
            clear_screen: inout std_logic 
        );
    end component;
    
    component video_out_wrapper 
        port (
            reset_rtl: in std_logic;  
            sys_clock: in std_logic;
            s_axis_tdata: in std_logic_vector(7 downto 0);
            s_axis_tvalid: in std_logic; 
            s_axis_tready: out std_logic;
            vid_active_video: out std_logic;
            vid_data: out std_logic_vector(7 downto 0);
            vid_hsync: out std_logic;
            vid_vsync: out std_logic;
            vid_locked: out std_logic
        );
    end component;
    signal reset_rtl: std_logic;
    signal s_axis_tdata: std_logic_vector(7 downto 0); 
    signal s_axis_tvalid: std_logic;
    signal s_axis_tready: std_logic;
    signal clear_screen: std_logic;
begin
    processor: core
        port map(
            clk => clk,
            clear_screen => clear_screen
        );
    video: video_out_wrapper 
        port map(
            reset_rtl => reset_rtl,
            sys_clock => clk,
            s_axis_tdata => s_axis_tdata,
            s_axis_tvalid => s_axis_tvalid,  
            s_axis_tready => s_axis_tready,
            vid_active_video => vid_active_video,
            vid_data => vid_data,
            vid_hsync => vid_hsync,
            vid_vsync => vid_vsync,
            vid_locked => vid_locked
        );
        


end Behavioral;
