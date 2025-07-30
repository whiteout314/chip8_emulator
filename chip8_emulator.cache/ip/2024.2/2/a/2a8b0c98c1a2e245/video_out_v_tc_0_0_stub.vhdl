-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Wed Jul 30 01:00:21 2025
-- Host        : calma-HP-Z2-Mini-G3-Workstation running 64-bit Ubuntu 24.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ video_out_v_tc_0_0_stub.vhdl
-- Design      : video_out_v_tc_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    clk : in STD_LOGIC;
    clken : in STD_LOGIC;
    gen_clken : in STD_LOGIC;
    sof_state : in STD_LOGIC;
    hsync_out : out STD_LOGIC;
    hblank_out : out STD_LOGIC;
    vsync_out : out STD_LOGIC;
    vblank_out : out STD_LOGIC;
    active_video_out : out STD_LOGIC;
    resetn : in STD_LOGIC;
    fsync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "video_out_v_tc_0_0,v_tc,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "video_out_v_tc_0_0,v_tc,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=v_tc,x_ipVersion=6.2,x_ipCoreRevision=9,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_HAS_AXI4_LITE=0,C_HAS_INTC_IF=0,C_ARBITRARY_RES_EN=0,C_VID_PPC=4,C_GEN_INTERLACED=0,C_GEN_HACTIVE_SIZE=1280,C_GEN_VACTIVE_SIZE=720,C_GEN_CPARITY=0,C_GEN_FIELDID_POLARITY=1,C_GEN_VBLANK_POLARITY=1,C_GEN_HBLANK_POLARITY=1,C_GEN_VSYNC_POLARITY=1,C_GEN_HSYNC_POLARITY=1,C_GEN_AVIDEO_POLARITY=1,C_GEN_ACHROMA_POLARITY=1,C_GEN_VIDEO_FORMAT=2,C_GEN_HFRAME_SIZE=1650,C_GEN_F0_VFRAME_SIZE=750,C_GEN_F1_VFRAME_SIZE=750,C_GEN_HSYNC_START=1390,C_GEN_HSYNC_END=1430,C_GEN_F0_VBLANK_HSTART=1280,C_GEN_F0_VBLANK_HEND=1280,C_GEN_F0_VSYNC_VSTART=724,C_GEN_F0_VSYNC_VEND=729,C_GEN_F0_VSYNC_HSTART=1280,C_GEN_F0_VSYNC_HEND=1280,C_GEN_F1_VBLANK_HSTART=1280,C_GEN_F1_VBLANK_HEND=1280,C_GEN_F1_VSYNC_VSTART=724,C_GEN_F1_VSYNC_VEND=729,C_GEN_F1_VSYNC_HSTART=1280,C_GEN_F1_VSYNC_HEND=1280,C_FSYNC_HSTART0=0,C_FSYNC_VSTART0=0,C_FSYNC_HSTART1=0,C_FSYNC_VSTART1=0,C_FSYNC_HSTART2=0,C_FSYNC_VSTART2=0,C_FSYNC_HSTART3=0,C_FSYNC_VSTART3=0,C_FSYNC_HSTART4=0,C_FSYNC_VSTART4=0,C_FSYNC_HSTART5=0,C_FSYNC_VSTART5=0,C_FSYNC_HSTART6=0,C_FSYNC_VSTART6=0,C_FSYNC_HSTART7=0,C_FSYNC_VSTART7=0,C_FSYNC_HSTART8=0,C_FSYNC_VSTART8=0,C_FSYNC_HSTART9=0,C_FSYNC_VSTART9=0,C_FSYNC_HSTART10=0,C_FSYNC_VSTART10=0,C_FSYNC_HSTART11=0,C_FSYNC_VSTART11=0,C_FSYNC_HSTART12=0,C_FSYNC_VSTART12=0,C_FSYNC_HSTART13=0,C_FSYNC_VSTART13=0,C_FSYNC_HSTART14=0,C_FSYNC_VSTART14=0,C_FSYNC_HSTART15=0,C_FSYNC_VSTART15=0,C_MAX_PIXELS=4096,C_MAX_LINES=4096,C_NUM_FSYNCS=1,C_INTERLACE_EN=0,C_GEN_AUTO_SWITCH=0,C_DETECT_EN=0,C_SYNC_EN=0,C_GENERATE_EN=1,C_DET_HSYNC_EN=1,C_DET_VSYNC_EN=1,C_DET_HBLANK_EN=1,C_DET_VBLANK_EN=1,C_DET_AVIDEO_EN=1,C_DET_ACHROMA_EN=0,C_GEN_HSYNC_EN=1,C_GEN_VSYNC_EN=1,C_GEN_HBLANK_EN=1,C_GEN_VBLANK_EN=1,C_GEN_AVIDEO_EN=1,C_GEN_ACHROMA_EN=0,C_GEN_FIELDID_EN=0,C_DET_FIELDID_EN=0}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,clken,gen_clken,sof_state,hsync_out,hblank_out,vsync_out,vblank_out,active_video_out,resetn,fsync_out[0:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk_intf CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk_intf";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF vtiming_in:vtiming_out, ASSOCIATED_RESET resetn, ASSOCIATED_CLKEN clken, FREQ_HZ 74250000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0";
  attribute x_interface_info of clken : signal is "xilinx.com:signal:clockenable:1.0 clken_intf CE";
  attribute x_interface_mode of clken : signal is "slave clken_intf";
  attribute x_interface_parameter of clken : signal is "XIL_INTERFACENAME clken_intf, POLARITY ACTIVE_HIGH";
  attribute x_interface_info of hsync_out : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out HSYNC";
  attribute x_interface_mode of hsync_out : signal is "master vtiming_out";
  attribute x_interface_info of hblank_out : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out HBLANK";
  attribute x_interface_info of vsync_out : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out VSYNC";
  attribute x_interface_info of vblank_out : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out VBLANK";
  attribute x_interface_info of active_video_out : signal is "xilinx.com:interface:video_timing:2.0 vtiming_out ACTIVE_VIDEO";
  attribute x_interface_info of resetn : signal is "xilinx.com:signal:reset:1.0 resetn_intf RST";
  attribute x_interface_mode of resetn : signal is "slave resetn_intf";
  attribute x_interface_parameter of resetn : signal is "XIL_INTERFACENAME resetn_intf, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "v_tc,Vivado 2024.2";
begin
end;
