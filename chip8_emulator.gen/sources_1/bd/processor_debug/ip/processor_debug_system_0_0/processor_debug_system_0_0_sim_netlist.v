// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Fri Aug  1 13:57:33 2025
// Host        : calma-HP-Z2-Mini-G3-Workstation running 64-bit Ubuntu 24.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/calma/Workspace/personal/chip8_emulator/chip8_emulator.gen/sources_1/bd/processor_debug/ip/processor_debug_system_0_0/processor_debug_system_0_0_sim_netlist.v
// Design      : processor_debug_system_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "processor_debug_system_0_0,system,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "system,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module processor_debug_system_0_0
   (clk,
    memory_data_out_lsb_out,
    memory_data_out_msb_out,
    RA_data_out_out,
    RB_data_out_out,
    opcode_out,
    PC_out);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN processor_debug_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  output [7:0]memory_data_out_lsb_out;
  output [7:0]memory_data_out_msb_out;
  output [7:0]RA_data_out_out;
  output [7:0]RB_data_out_out;
  output [15:0]opcode_out;
  output [15:0]PC_out;

  wire \<const0> ;

  assign PC_out[15] = \<const0> ;
  assign PC_out[14] = \<const0> ;
  assign PC_out[13] = \<const0> ;
  assign PC_out[12] = \<const0> ;
  assign PC_out[11] = \<const0> ;
  assign PC_out[10] = \<const0> ;
  assign PC_out[9] = \<const0> ;
  assign PC_out[8] = \<const0> ;
  assign PC_out[7] = \<const0> ;
  assign PC_out[6] = \<const0> ;
  assign PC_out[5] = \<const0> ;
  assign PC_out[4] = \<const0> ;
  assign PC_out[3] = \<const0> ;
  assign PC_out[2] = \<const0> ;
  assign PC_out[1] = \<const0> ;
  assign PC_out[0] = \<const0> ;
  assign RA_data_out_out[7] = \<const0> ;
  assign RA_data_out_out[6] = \<const0> ;
  assign RA_data_out_out[5] = \<const0> ;
  assign RA_data_out_out[4] = \<const0> ;
  assign RA_data_out_out[3] = \<const0> ;
  assign RA_data_out_out[2] = \<const0> ;
  assign RA_data_out_out[1] = \<const0> ;
  assign RA_data_out_out[0] = \<const0> ;
  assign RB_data_out_out[7] = \<const0> ;
  assign RB_data_out_out[6] = \<const0> ;
  assign RB_data_out_out[5] = \<const0> ;
  assign RB_data_out_out[4] = \<const0> ;
  assign RB_data_out_out[3] = \<const0> ;
  assign RB_data_out_out[2] = \<const0> ;
  assign RB_data_out_out[1] = \<const0> ;
  assign RB_data_out_out[0] = \<const0> ;
  assign memory_data_out_lsb_out[7] = \<const0> ;
  assign memory_data_out_lsb_out[6] = \<const0> ;
  assign memory_data_out_lsb_out[5] = \<const0> ;
  assign memory_data_out_lsb_out[4] = \<const0> ;
  assign memory_data_out_lsb_out[3] = \<const0> ;
  assign memory_data_out_lsb_out[2] = \<const0> ;
  assign memory_data_out_lsb_out[1] = \<const0> ;
  assign memory_data_out_lsb_out[0] = \<const0> ;
  assign memory_data_out_msb_out[7] = \<const0> ;
  assign memory_data_out_msb_out[6] = \<const0> ;
  assign memory_data_out_msb_out[5] = \<const0> ;
  assign memory_data_out_msb_out[4] = \<const0> ;
  assign memory_data_out_msb_out[3] = \<const0> ;
  assign memory_data_out_msb_out[2] = \<const0> ;
  assign memory_data_out_msb_out[1] = \<const0> ;
  assign memory_data_out_msb_out[0] = \<const0> ;
  assign opcode_out[15] = \<const0> ;
  assign opcode_out[14] = \<const0> ;
  assign opcode_out[13] = \<const0> ;
  assign opcode_out[12] = \<const0> ;
  assign opcode_out[11] = \<const0> ;
  assign opcode_out[10] = \<const0> ;
  assign opcode_out[9] = \<const0> ;
  assign opcode_out[8] = \<const0> ;
  assign opcode_out[7] = \<const0> ;
  assign opcode_out[6] = \<const0> ;
  assign opcode_out[5] = \<const0> ;
  assign opcode_out[4] = \<const0> ;
  assign opcode_out[3] = \<const0> ;
  assign opcode_out[2] = \<const0> ;
  assign opcode_out[1] = \<const0> ;
  assign opcode_out[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
