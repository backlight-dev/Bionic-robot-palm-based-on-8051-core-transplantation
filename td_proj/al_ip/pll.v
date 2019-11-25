/************************************************************\
 **  Copyright (c) 2011-2021 Anlogic, Inc.
 **  All Right Reserved.
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	C:/Users/lenovo/Desktop/MC8051_Version1_6_TDV5/MC8051_Version1_6_TDV5/td_proj/al_ip/pll.v
 ** Date	:	2019 11 18
 ** TD version	:	4.6.14314
\************************************************************/

///////////////////////////////////////////////////////////////////////////////
//	Input frequency:             24.000Mhz
//	Clock multiplication factor: 1
//	Clock division factor:       2
//	Clock information:
//		Clock name	| Frequency 	| Phase shift
//		C0        	| 12.000000 MHZ	| 0  DEG     
//		C1        	| 11.111111 MHZ	| 0  DEG     
//		C2        	| 6.000000  MHZ	| 0  DEG     
//		C3        	| 3.000000  MHZ	| 0  DEG     
//		C4        	| 2.343750  MHZ	| 0  DEG     
///////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 100 fs

module pll(refclk,
		reset,
		clk0_out,
		clk1_out,
		clk2_out,
		clk3_out,
		clk4_out);

	input refclk;
	input reset;
	output clk0_out;
	output clk1_out;
	output clk2_out;
	output clk3_out;
	output clk4_out;

	wire clk0_buf;

	EG_LOGIC_BUFG bufg_feedback( .i(clk0_buf), .o(clk0_out) );

	EG_PHY_PLL #(.DPHASE_SOURCE("DISABLE"),
		.DYNCFG("DISABLE"),
		.FIN("24.000"),
		.FEEDBK_MODE("NORMAL"),
		.FEEDBK_PATH("CLKC0_EXT"),
		.STDBY_ENABLE("DISABLE"),
		.PLLRST_ENA("ENABLE"),
		.SYNC_ENABLE("DISABLE"),
		.DERIVE_PLL_CLOCKS("DISABLE"),
		.GEN_BASIC_CLOCK("DISABLE"),
		.GMC_GAIN(0),
		.ICP_CURRENT(9),
		.KVCO(2),
		.LPF_CAPACITOR(2),
		.LPF_RESISTOR(8),
		.REFCLK_DIV(2),
		.FBCLK_DIV(1),
		.CLKC0_ENABLE("ENABLE"),
		.CLKC0_DIV(25),
		.CLKC0_CPHASE(24),
		.CLKC0_FPHASE(0),
		.CLKC1_ENABLE("ENABLE"),
		.CLKC1_DIV(27),
		.CLKC1_CPHASE(26),
		.CLKC1_FPHASE(0),
		.CLKC2_ENABLE("ENABLE"),
		.CLKC2_DIV(50),
		.CLKC2_CPHASE(49),
		.CLKC2_FPHASE(0),
		.CLKC3_ENABLE("ENABLE"),
		.CLKC3_DIV(100),
		.CLKC3_CPHASE(99),
		.CLKC3_FPHASE(0),
		.CLKC4_ENABLE("ENABLE"),
		.CLKC4_DIV(128),
		.CLKC4_CPHASE(127),
		.CLKC4_FPHASE(0)	)
	pll_inst (.refclk(refclk),
		.reset(reset),
		.stdby(1'b0),
		.extlock(open),
		.psclk(1'b0),
		.psdown(1'b0),
		.psstep(1'b0),
		.psclksel(3'b000),
		.psdone(open),
		.dclk(1'b0),
		.dcs(1'b0),
		.dwe(1'b0),
		.di(8'b00000000),
		.daddr(6'b000000),
		.do({open, open, open, open, open, open, open, open}),
		.fbclk(clk0_out),
		.clkc({clk4_out, clk3_out, clk2_out, clk1_out, clk0_buf}));

endmodule
