----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/30/2025 10:54:42 PM
-- Design Name: 
-- Module Name: display - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity display is
    Port ( 
        clk: in std_logic;
        clear_screen: in std_logic;
        memory_addr: in std_logic_vector(15 downto 0);
        memory_data_out_lsb: out std_logic_vector(7 downto 0);
        memory_data_out_msb: out std_logic_vector(7 downto 0);
        screen: in std_logic_vector(2047 downto 0)
    );
end display;

architecture Behavioral of display is

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

    signal reset_rtl: std_logic := '0';
    signal s_axis_tdata: std_logic_vector(7 downto 0) := (others => '0');
    signal s_axis_tvalid: std_logic := '0';
    signal s_axis_tready: std_logic;
    signal vid_active_video: std_logic; 
    signal vid_data: std_logic_vector(7 downto 0);
    signal vid_hsync: std_logic; 
    signal vid_vsync: std_logic;
    signal vid_locked: std_logic;

    signal pixel : integer range 0 to 2047 := 0;

begin

    display_processor: process(clk)
    begin
        if rising_edge(clk) then
            if clear_screen = '1' then
                pixel <= 0;
                s_axis_tvalid <= '0';
                s_axis_tdata <= (others => '0');
            else
                if pixel <= 2047 then
                    if screen(pixel) = '1' then
                        s_axis_tdata <= x"FF";
                    else
                        s_axis_tdata <= x"00";
                    end if;
                    s_axis_tvalid <= '1';
                    pixel <= pixel + 1;
                else
                    pixel <= 0;  -- loop back
                end if;
            end if;
        end if;
    end process;

    video_out: video_out_wrapper 
        port map (
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
