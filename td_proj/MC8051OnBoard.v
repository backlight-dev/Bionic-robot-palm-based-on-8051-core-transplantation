module  MC8051OnBoard(
input sysclk,//连接了系统时钟(K14)
input  key,  //连接了SW0(T4),置1时，PLL输出
input  key_0,//后来加的
input  key_1,
input  key_2,
input  key_3,
input  key_4,
input  key_5,
input  key_6,
input  key_7,
input  key_8,
input  key_9,
input  key_10,
input  key_11,
input  key_12,
input  key_13,
input  key_14,
input  key_15,


output GPIO_0,//后来加的
output GPIO_1,//后来加的
output GPIO_2,//后来加的
output GPIO_3,//后来加的
output GPIO_4,//后来加的
output GPIO_5,//后来加的
output GPIO_6,//后来加的
output GPIO_7,//后来加的
output GPIO_8,//后来加的
output GPIO_9,//后来加的
output GPIO_10,//后来加的
output GPIO_11,//后来加的
output GPIO_12,//后来加的
output GPIO_13,//后来加的
output GPIO_14,//后来加的
output GPIO_15,//后来加的


output pllclk,//连接了GPIO(A10)
output keyled,//连接了LED0(M3)
output led//连接了LED2(N3)
);

wire reset =key;
wire n_reset =!key;
wire [7:0] P1_o;
wire [7:0] P2_o;

wire [7:0] P1_i;
assign P1_i={key_7,key_6,key_5,key_4,key_3,key_2,key_1,key_0};
wire [7:0] P2_i;
assign P2_i={key_15,key_14,key_13,key_12,key_11,key_10,key_9,key_8};
//assign P1[5]=keyled;//为了测试BIT文件，并修改了ADC文件
//assign led=P1[0];

assign GPIO_0=P1_o[0];//为了测试BIT文件，并修改了ADC文件
assign GPIO_1=P1_o[1];//为了测试BIT文件，并修改了ADC文件
assign GPIO_2=P1_o[2];//为了测试BIT文件，并修改了ADC文件
assign GPIO_3=P1_o[3];//为了测试BIT文件，并修改了ADC文件
assign GPIO_4=P1_o[4];//为了测试BIT文件，并修改了ADC文件
assign GPIO_5=P1_o[5];//为了测试BIT文件，并修改了ADC文件
assign GPIO_6=P1_o[6];//为了测试BIT文件，并修改了ADC文件
assign GPIO_7=P1_o[7];//为了测试BIT文件，并修改了ADC文件
assign GPIO_8=P2_o[0];//为了测试BIT文件，并修改了ADC文件
assign GPIO_9=P2_o[1];//为了测试BIT文件，并修改了ADC文件
assign GPIO_10=P2_o[2];//为了测试BIT文件，并修改了ADC文件
assign GPIO_11=P2_o[3];//为了测试BIT文件，并修改了ADC文件
assign GPIO_12=P2_o[4];//为了测试BIT文件，并修改了ADC文件
assign GPIO_13=P2_o[5];//为了测试BIT文件，并修改了ADC文件
assign GPIO_14=P2_o[6];//为了测试BIT文件，并修改了ADC文件
assign GPIO_15=P2_o[7];//为了测试BIT文件，并修改了ADC文件



assign keyled=!key;
//assign GPIO_1=P1[1];//后来加的 
//assign keyled=key_2;
//看看按键好不好使assign keyled=!key;
wire mcu_clk;
 pll  u_pll(
        .refclk(sysclk),
		.reset(n_reset),
		.clk0_out(),
		.clk1_out(),
		.clk2_out(),
		.clk3_out(),
		.clk4_out(mcu_clk)
);


mc8051_top u8051_inst(
	.clk(mcu_clk),
	//.reset(n_reset),
	.reset(1'b0),
	.int0_i (1'b0),
	.int1_i (1'b0),
        //-- counter input 0 for T/C
	.all_t0_i(1'b0),
        //-- counter input 1 for T/C
	.all_t1_i(1'b0),
        //-- serial input for SIU
	.all_rxd_i(1'b1),
        .p0_i (8'hff),
        .p1_i (P1_i),
        .p2_i (P2_i),
        .p3_i(8'hff),

        .p0_o(),
        .p1_o(P1_o),
        .p2_o(P2_o),
        .p3_o(),
        //-- Mode 0 serial output for SIU
        .all_rxd_o(),
        //-- serial output for SIU 
        .all_txd_o(),
        //-- rxd direction signal
        .all_rxdwr_o ()
);



endmodule 