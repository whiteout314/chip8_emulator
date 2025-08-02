-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Fri Aug  1 13:57:33 2025
-- Host        : calma-HP-Z2-Mini-G3-Workstation running 64-bit Ubuntu 24.04.1 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/calma/Workspace/personal/chip8_emulator/chip8_emulator.gen/sources_1/bd/processor_debug/ip/processor_debug_system_0_0/processor_debug_system_0_0_sim_netlist.vhdl
-- Design      : processor_debug_system_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity processor_debug_system_0_0 is
  port (
    clk : in STD_LOGIC;
    memory_data_out_lsb_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    memory_data_out_msb_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    RA_data_out_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    RB_data_out_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    opcode_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    PC_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of processor_debug_system_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of processor_debug_system_0_0 : entity is "processor_debug_system_0_0,system,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of processor_debug_system_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of processor_debug_system_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of processor_debug_system_0_0 : entity is "system,Vivado 2024.2";
end processor_debug_system_0_0;

architecture STRUCTURE of processor_debug_system_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN processor_debug_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
begin
  PC_out(15) <= \<const0>\;
  PC_out(14) <= \<const0>\;
  PC_out(13) <= \<const0>\;
  PC_out(12) <= \<const0>\;
  PC_out(11) <= \<const0>\;
  PC_out(10) <= \<const0>\;
  PC_out(9) <= \<const0>\;
  PC_out(8) <= \<const0>\;
  PC_out(7) <= \<const0>\;
  PC_out(6) <= \<const0>\;
  PC_out(5) <= \<const0>\;
  PC_out(4) <= \<const0>\;
  PC_out(3) <= \<const0>\;
  PC_out(2) <= \<const0>\;
  PC_out(1) <= \<const0>\;
  PC_out(0) <= \<const0>\;
  RA_data_out_out(7) <= \<const0>\;
  RA_data_out_out(6) <= \<const0>\;
  RA_data_out_out(5) <= \<const0>\;
  RA_data_out_out(4) <= \<const0>\;
  RA_data_out_out(3) <= \<const0>\;
  RA_data_out_out(2) <= \<const0>\;
  RA_data_out_out(1) <= \<const0>\;
  RA_data_out_out(0) <= \<const0>\;
  RB_data_out_out(7) <= \<const0>\;
  RB_data_out_out(6) <= \<const0>\;
  RB_data_out_out(5) <= \<const0>\;
  RB_data_out_out(4) <= \<const0>\;
  RB_data_out_out(3) <= \<const0>\;
  RB_data_out_out(2) <= \<const0>\;
  RB_data_out_out(1) <= \<const0>\;
  RB_data_out_out(0) <= \<const0>\;
  memory_data_out_lsb_out(7) <= \<const0>\;
  memory_data_out_lsb_out(6) <= \<const0>\;
  memory_data_out_lsb_out(5) <= \<const0>\;
  memory_data_out_lsb_out(4) <= \<const0>\;
  memory_data_out_lsb_out(3) <= \<const0>\;
  memory_data_out_lsb_out(2) <= \<const0>\;
  memory_data_out_lsb_out(1) <= \<const0>\;
  memory_data_out_lsb_out(0) <= \<const0>\;
  memory_data_out_msb_out(7) <= \<const0>\;
  memory_data_out_msb_out(6) <= \<const0>\;
  memory_data_out_msb_out(5) <= \<const0>\;
  memory_data_out_msb_out(4) <= \<const0>\;
  memory_data_out_msb_out(3) <= \<const0>\;
  memory_data_out_msb_out(2) <= \<const0>\;
  memory_data_out_msb_out(1) <= \<const0>\;
  memory_data_out_msb_out(0) <= \<const0>\;
  opcode_out(15) <= \<const0>\;
  opcode_out(14) <= \<const0>\;
  opcode_out(13) <= \<const0>\;
  opcode_out(12) <= \<const0>\;
  opcode_out(11) <= \<const0>\;
  opcode_out(10) <= \<const0>\;
  opcode_out(9) <= \<const0>\;
  opcode_out(8) <= \<const0>\;
  opcode_out(7) <= \<const0>\;
  opcode_out(6) <= \<const0>\;
  opcode_out(5) <= \<const0>\;
  opcode_out(4) <= \<const0>\;
  opcode_out(3) <= \<const0>\;
  opcode_out(2) <= \<const0>\;
  opcode_out(1) <= \<const0>\;
  opcode_out(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
end STRUCTURE;
