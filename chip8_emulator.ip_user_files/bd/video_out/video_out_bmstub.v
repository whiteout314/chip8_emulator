// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module video_out (
  sys_clock,
  reset_rtl,
  vid_active_video,
  vid_data,
  vid_hsync,
  vid_vsync,
  vid_locked,
  s_axis_tdata,
  s_axis_tvalid,
  s_axis_tready
);

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.SYS_CLOCK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN video_out_sys_clock, INSERT_VIP 0" *)
  input sys_clock;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST" *)
  (* X_INTERFACE_MODE = "slave RST.RESET_RTL" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
  input reset_rtl;
  (* X_INTERFACE_IGNORE = "true" *)
  output vid_active_video;
  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]vid_data;
  (* X_INTERFACE_IGNORE = "true" *)
  output vid_hsync;
  (* X_INTERFACE_IGNORE = "true" *)
  output vid_vsync;
  (* X_INTERFACE_IGNORE = "true" *)
  output vid_locked;
  (* X_INTERFACE_IGNORE = "true" *)
  input [7:0]s_axis_tdata;
  (* X_INTERFACE_IGNORE = "true" *)
  input s_axis_tvalid;
  (* X_INTERFACE_IGNORE = "true" *)
  output s_axis_tready;

  // stub module has no contents

endmodule
