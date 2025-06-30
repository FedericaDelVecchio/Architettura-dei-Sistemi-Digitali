// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1.1 (win64) Build 3900603 Fri Jun 16 19:31:24 MDT 2023
// Date        : Sat Jan 20 17:01:43 2024
// Host        : Laptop-Fede running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/VHDL/TESINA/esercizio_6/esercizio_6.sim/sim_1/synth/func/xsim/CU_tb_func_synth.v
// Design      : CU
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module CU
   (start,
    reset,
    clk,
    \output ,
    stop);
  input start;
  input reset;
  input clk;
  output [3:0]\output ;
  output stop;

  wire \FSM_sequential_stato_corrente_reg_n_0_[1] ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire contatore_n_5;
  wire [3:0]count;
  wire [3:0]d_in;
  wire en_cont;
  wire [3:0]\output ;
  wire [3:0]output_OBUF;
  wire read_ROM_reg_i_1_n_0;
  wire read_ROM_reg_i_2_n_0;
  wire [3:0]read_data;
  wire reset;
  wire reset_IBUF;
  wire start;
  wire start_IBUF;
  wire [0:0]stato_corrente;
  wire [1:0]stato_prossimo;
  wire stop;
  wire stop_OBUF;
  wire stop_reg_i_1_n_0;
  wire write_MEM;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0C7C)) 
    \FSM_sequential_stato_corrente[1]_i_1 
       (.I0(start_IBUF),
        .I1(stato_corrente),
        .I2(\FSM_sequential_stato_corrente_reg_n_0_[1] ),
        .I3(reset_IBUF),
        .O(stato_prossimo[1]));
  (* FSM_ENCODED_STATES = "s1:01,s2:10,s4:11,s0:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_stato_corrente_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(stato_prossimo[0]),
        .Q(stato_corrente),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s1:01,s2:10,s4:11,s0:00" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_stato_corrente_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(stato_prossimo[1]),
        .Q(\FSM_sequential_stato_corrente_reg_n_0_[1] ),
        .R(1'b0));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  cont_mod_n contatore
       (.CLK(clk_IBUF_BUFG),
        .D(stato_prossimo[0]),
        .E(en_cont),
        .\FSM_sequential_stato_corrente_reg[0] ({\FSM_sequential_stato_corrente_reg_n_0_[1] ,stato_corrente}),
        .\FSM_sequential_stato_corrente_reg[1] (contatore_n_5),
        .Q(count),
        .reset_IBUF(reset_IBUF),
        .start_IBUF(start_IBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    en_cont_reg
       (.CLR(1'b0),
        .D(read_ROM_reg_i_1_n_0),
        .G(contatore_n_5),
        .GE(1'b1),
        .Q(en_cont));
  M machine_m
       (.Q(read_data),
        .d_in(d_in));
  MEM mem_mem
       (.CLK(clk_IBUF_BUFG),
        .Q(count),
        .d_in(d_in),
        .d_out(output_OBUF),
        .write_MEM(write_MEM));
  ROM mem_rom
       (.CLK(clk_IBUF_BUFG),
        .D(count),
        .E(write_MEM),
        .Q(read_data));
  OBUF \output[0]_INST_0 
       (.I(output_OBUF[0]),
        .O(\output [0]));
  OBUF \output[1]_INST_0 
       (.I(output_OBUF[1]),
        .O(\output [1]));
  OBUF \output[2]_INST_0 
       (.I(output_OBUF[2]),
        .O(\output [2]));
  OBUF \output[3]_INST_0 
       (.I(output_OBUF[3]),
        .O(\output [3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    read_ROM_reg
       (.CLR(1'b0),
        .D(read_ROM_reg_i_1_n_0),
        .G(read_ROM_reg_i_2_n_0),
        .GE(1'b1),
        .Q(write_MEM));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    read_ROM_reg_i_1
       (.I0(stato_corrente),
        .I1(\FSM_sequential_stato_corrente_reg_n_0_[1] ),
        .O(read_ROM_reg_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    read_ROM_reg_i_2
       (.I0(stato_corrente),
        .I1(\FSM_sequential_stato_corrente_reg_n_0_[1] ),
        .O(read_ROM_reg_i_2_n_0));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  IBUF start_IBUF_inst
       (.I(start),
        .O(start_IBUF));
  OBUF stop_OBUF_inst
       (.I(stop_OBUF),
        .O(stop));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    stop_reg
       (.CLR(1'b0),
        .D(\FSM_sequential_stato_corrente_reg_n_0_[1] ),
        .G(stop_reg_i_1_n_0),
        .GE(1'b1),
        .Q(stop_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h9)) 
    stop_reg_i_1
       (.I0(stato_corrente),
        .I1(\FSM_sequential_stato_corrente_reg_n_0_[1] ),
        .O(stop_reg_i_1_n_0));
endmodule

module M
   (d_in,
    Q);
  output [3:0]d_in;
  input [3:0]Q;

  wire [3:0]Q;
  wire [3:0]d_in;

  LUT1 #(
    .INIT(2'h1)) 
    mem_data_reg_0_15_0_0_i_1
       (.I0(Q[0]),
        .O(d_in[0]));
  LUT1 #(
    .INIT(2'h1)) 
    mem_data_reg_0_15_1_1_i_1
       (.I0(Q[1]),
        .O(d_in[1]));
  LUT1 #(
    .INIT(2'h1)) 
    mem_data_reg_0_15_2_2_i_1
       (.I0(Q[2]),
        .O(d_in[2]));
  LUT1 #(
    .INIT(2'h1)) 
    mem_data_reg_0_15_3_3_i_1
       (.I0(Q[3]),
        .O(d_in[3]));
endmodule

module MEM
   (d_out,
    CLK,
    d_in,
    write_MEM,
    Q);
  output [3:0]d_out;
  input CLK;
  input [3:0]d_in;
  input write_MEM;
  input [3:0]Q;

  wire CLK;
  wire [3:0]Q;
  wire [3:0]d_in;
  wire [3:0]d_out;
  wire write_MEM;

  (* RTL_RAM_BITS = "64" *) 
  (* RTL_RAM_NAME = "mem_mem/mem_data_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "0" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    mem_data_reg_0_15_0_0
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .A4(1'b0),
        .D(d_in[0]),
        .O(d_out[0]),
        .WCLK(CLK),
        .WE(write_MEM));
  (* RTL_RAM_BITS = "64" *) 
  (* RTL_RAM_NAME = "mem_mem/mem_data_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "1" *) 
  (* ram_slice_end = "1" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    mem_data_reg_0_15_1_1
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .A4(1'b0),
        .D(d_in[1]),
        .O(d_out[1]),
        .WCLK(CLK),
        .WE(write_MEM));
  (* RTL_RAM_BITS = "64" *) 
  (* RTL_RAM_NAME = "mem_mem/mem_data_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    mem_data_reg_0_15_2_2
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .A4(1'b0),
        .D(d_in[2]),
        .O(d_out[2]),
        .WCLK(CLK),
        .WE(write_MEM));
  (* RTL_RAM_BITS = "64" *) 
  (* RTL_RAM_NAME = "mem_mem/mem_data_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1S" *) 
  (* XILINX_TRANSFORM_PINMAP = "GND:A4" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM32X1S #(
    .INIT(32'h00000000)) 
    mem_data_reg_0_15_3_3
       (.A0(Q[0]),
        .A1(Q[1]),
        .A2(Q[2]),
        .A3(Q[3]),
        .A4(1'b0),
        .D(d_in[3]),
        .O(d_out[3]),
        .WCLK(CLK),
        .WE(write_MEM));
endmodule

module ROM
   (Q,
    E,
    D,
    CLK);
  output [3:0]Q;
  input [0:0]E;
  input [3:0]D;
  input CLK;

  wire CLK;
  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;

  FDRE #(
    .INIT(1'b0)) 
    \read_data_reg[0] 
       (.C(CLK),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_data_reg[1] 
       (.C(CLK),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_data_reg[2] 
       (.C(CLK),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_data_reg[3] 
       (.C(CLK),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
endmodule

module cont_mod_n
   (Q,
    D,
    \FSM_sequential_stato_corrente_reg[1] ,
    reset_IBUF,
    \FSM_sequential_stato_corrente_reg[0] ,
    start_IBUF,
    E,
    CLK);
  output [3:0]Q;
  output [0:0]D;
  output \FSM_sequential_stato_corrente_reg[1] ;
  input reset_IBUF;
  input [1:0]\FSM_sequential_stato_corrente_reg[0] ;
  input start_IBUF;
  input [0:0]E;
  input CLK;

  wire CLK;
  wire [0:0]D;
  wire [0:0]E;
  wire \FSM_sequential_stato_corrente[0]_i_2_n_0 ;
  wire [1:0]\FSM_sequential_stato_corrente_reg[0] ;
  wire \FSM_sequential_stato_corrente_reg[1] ;
  wire [3:0]Q;
  wire [3:0]p_0_in;
  wire reset_IBUF;
  wire start_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h30337400)) 
    \FSM_sequential_stato_corrente[0]_i_1 
       (.I0(reset_IBUF),
        .I1(\FSM_sequential_stato_corrente_reg[0] [0]),
        .I2(\FSM_sequential_stato_corrente[0]_i_2_n_0 ),
        .I3(\FSM_sequential_stato_corrente_reg[0] [1]),
        .I4(start_IBUF),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00004000)) 
    \FSM_sequential_stato_corrente[0]_i_2 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(reset_IBUF),
        .O(\FSM_sequential_stato_corrente[0]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \counter_value[0]_i_1 
       (.I0(Q[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \counter_value[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \counter_value[2]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \counter_value[3]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .O(p_0_in[3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_value_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(reset_IBUF),
        .D(p_0_in[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_value_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(reset_IBUF),
        .D(p_0_in[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_value_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(reset_IBUF),
        .D(p_0_in[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_value_reg[3] 
       (.C(CLK),
        .CE(E),
        .CLR(reset_IBUF),
        .D(p_0_in[3]),
        .Q(Q[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    en_cont_reg_i_1
       (.I0(\FSM_sequential_stato_corrente_reg[0] [1]),
        .I1(\FSM_sequential_stato_corrente[0]_i_2_n_0 ),
        .I2(\FSM_sequential_stato_corrente_reg[0] [0]),
        .O(\FSM_sequential_stato_corrente_reg[1] ));
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
