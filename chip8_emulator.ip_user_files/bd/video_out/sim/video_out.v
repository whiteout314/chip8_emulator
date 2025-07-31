//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Wed Jul 30 00:59:28 2025
//Host        : calma-HP-Z2-Mini-G3-Workstation running 64-bit Ubuntu 24.04.1 LTS
//Command     : generate_target video_out.bd
//Design      : video_out
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "video_out,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=video_out,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=2,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "video_out.hwdef" *) 
module video_out
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_rtl;
  input [7:0]s_axis_tdata;
  output s_axis_tready;
  input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN video_out_sys_clock, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;
  output vid_active_video;
  output [7:0]vid_data;
  output vid_hsync;
  output vid_locked;
  output vid_vsync;

  wire [7:0]axis_subset_converter_0_M_AXIS_TDATA;
  wire axis_subset_converter_0_M_AXIS_TREADY;
  wire axis_subset_converter_0_M_AXIS_TVALID;
  wire clk_wiz_clk_out1;
  wire clk_wiz_locked;
  wire reset_rtl;
  wire [0:0]rst_clk_wiz_74M_peripheral_aresetn;
  wire [7:0]s_axis_tdata;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire sys_clock;
  wire v_axi4s_vid_out_0_vtg_ce;
  wire v_tc_0_vtiming_out_ACTIVE_VIDEO;
  wire v_tc_0_vtiming_out_HBLANK;
  wire v_tc_0_vtiming_out_HSYNC;
  wire v_tc_0_vtiming_out_VBLANK;
  wire v_tc_0_vtiming_out_VSYNC;
  wire vid_active_video;
  wire [7:0]vid_data;
  wire vid_hsync;
  wire vid_locked;
  wire vid_vsync;

  video_out_axis_subset_converter_0_0 axis_subset_converter_0
       (.aclk(clk_wiz_clk_out1),
        .aresetn(rst_clk_wiz_74M_peripheral_aresetn),
        .m_axis_tdata(axis_subset_converter_0_M_AXIS_TDATA),
        .m_axis_tready(axis_subset_converter_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_subset_converter_0_M_AXIS_TVALID),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
  video_out_clk_wiz_0 clk_wiz
       (.clk_in1(sys_clock),
        .clk_out1(clk_wiz_clk_out1),
        .locked(clk_wiz_locked),
        .reset(reset_rtl));
  video_out_rst_clk_wiz_74M_0 rst_clk_wiz_74M
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(reset_rtl),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_clk_wiz_74M_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_clk_out1));
  video_out_v_axi4s_vid_out_0_1 v_axi4s_vid_out_0
       (.aclk(clk_wiz_clk_out1),
        .aclken(1'b1),
        .aresetn(1'b1),
        .fid(1'b0),
        .locked(vid_locked),
        .s_axis_video_tdata(axis_subset_converter_0_M_AXIS_TDATA),
        .s_axis_video_tlast(1'b0),
        .s_axis_video_tready(axis_subset_converter_0_M_AXIS_TREADY),
        .s_axis_video_tuser(1'b0),
        .s_axis_video_tvalid(axis_subset_converter_0_M_AXIS_TVALID),
        .vid_active_video(vid_active_video),
        .vid_data(vid_data),
        .vid_hsync(vid_hsync),
        .vid_io_out_ce(1'b1),
        .vid_vsync(vid_vsync),
        .vtg_active_video(v_tc_0_vtiming_out_ACTIVE_VIDEO),
        .vtg_ce(v_axi4s_vid_out_0_vtg_ce),
        .vtg_field_id(1'b0),
        .vtg_hblank(v_tc_0_vtiming_out_HBLANK),
        .vtg_hsync(v_tc_0_vtiming_out_HSYNC),
        .vtg_vblank(v_tc_0_vtiming_out_VBLANK),
        .vtg_vsync(v_tc_0_vtiming_out_VSYNC));
  video_out_v_tc_0_0 v_tc_0
       (.active_video_out(v_tc_0_vtiming_out_ACTIVE_VIDEO),
        .clk(clk_wiz_clk_out1),
        .clken(1'b1),
        .gen_clken(v_axi4s_vid_out_0_vtg_ce),
        .hblank_out(v_tc_0_vtiming_out_HBLANK),
        .hsync_out(v_tc_0_vtiming_out_HSYNC),
        .resetn(rst_clk_wiz_74M_peripheral_aresetn),
        .sof_state(1'b0),
        .vblank_out(v_tc_0_vtiming_out_VBLANK),
        .vsync_out(v_tc_0_vtiming_out_VSYNC));
endmodule
