//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Wed Jul 30 00:44:11 2025
//Host        : calma-HP-Z2-Mini-G3-Workstation running 64-bit Ubuntu 24.04.1 LTS
//Command     : generate_target video_out_wrapper.bd
//Design      : video_out_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module video_out_wrapper
   (reset_rtl,
    s_axis_tdata,
    s_axis_tready,
    s_axis_tvalid,
    sys_clock,
    vid_active_video,
    vid_data,
    vid_hsync,
    vid_locked,
    vid_vsync);
  input reset_rtl;
  input [7:0]s_axis_tdata;
  output s_axis_tready;
  input s_axis_tvalid;
  input sys_clock;
  output vid_active_video;
  output [7:0]vid_data;
  output vid_hsync;
  output vid_locked;
  output vid_vsync;

  wire reset_rtl;
  wire [7:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire sys_clock;
  wire vid_active_video;
  wire [7:0]vid_data;
  wire vid_hsync;
  wire vid_locked;
  wire vid_vsync;

  video_out video_out_i
       (.reset_rtl(reset_rtl),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .sys_clock(sys_clock),
        .vid_active_video(vid_active_video),
        .vid_data(vid_data),
        .vid_hsync(vid_hsync),
        .vid_locked(vid_locked),
        .vid_vsync(vid_vsync));
endmodule
