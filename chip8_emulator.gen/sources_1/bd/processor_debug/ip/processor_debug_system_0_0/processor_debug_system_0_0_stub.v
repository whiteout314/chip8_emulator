// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Fri Aug  1 13:57:33 2025
// Host        : calma-HP-Z2-Mini-G3-Workstation running 64-bit Ubuntu 24.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/calma/Workspace/personal/chip8_emulator/chip8_emulator.gen/sources_1/bd/processor_debug/ip/processor_debug_system_0_0/processor_debug_system_0_0_stub.v
// Design      : processor_debug_system_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "processor_debug_system_0_0,system,{}" *) (* CORE_GENERATION_INFO = "processor_debug_system_0_0,system,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=system,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "system,Vivado 2024.2" *) 
module processor_debug_system_0_0(clk, memory_data_out_lsb_out, 
  memory_data_out_msb_out, RA_data_out_out, RB_data_out_out, opcode_out, PC_out)
/* synthesis syn_black_box black_box_pad_pin="clk,memory_data_out_lsb_out[7:0],memory_data_out_msb_out[7:0],RA_data_out_out[7:0],RB_data_out_out[7:0],opcode_out[15:0],PC_out[15:0]" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN processor_debug_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  output [7:0]memory_data_out_lsb_out;
  output [7:0]memory_data_out_msb_out;
  output [7:0]RA_data_out_out;
  output [7:0]RB_data_out_out;
  output [15:0]opcode_out;
  output [15:0]PC_out;
endmodule
