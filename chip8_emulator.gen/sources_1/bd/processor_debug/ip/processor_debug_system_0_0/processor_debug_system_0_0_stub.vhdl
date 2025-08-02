-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Fri Aug  1 13:57:33 2025
-- Host        : calma-HP-Z2-Mini-G3-Workstation running 64-bit Ubuntu 24.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/calma/Workspace/personal/chip8_emulator/chip8_emulator.gen/sources_1/bd/processor_debug/ip/processor_debug_system_0_0/processor_debug_system_0_0_stub.vhdl
-- Design      : processor_debug_system_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor_debug_system_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    memory_data_out_lsb_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    memory_data_out_msb_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    RA_data_out_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    RB_data_out_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    opcode_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    PC_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of processor_debug_system_0_0 : entity is "processor_debug_system_0_0,system,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of processor_debug_system_0_0 : entity is "processor_debug_system_0_0,system,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=system,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of processor_debug_system_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of processor_debug_system_0_0 : entity is "module_ref";
end processor_debug_system_0_0;

architecture stub of processor_debug_system_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,memory_data_out_lsb_out[7:0],memory_data_out_msb_out[7:0],RA_data_out_out[7:0],RB_data_out_out[7:0],opcode_out[15:0],PC_out[15:0]";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN processor_debug_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "system,Vivado 2024.2";
begin
end;
