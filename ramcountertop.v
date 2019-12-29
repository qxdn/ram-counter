module ramcountertop(clk,address,wren,rden,LOAD_N,Reset_N,EN,seg_sel,seg_led);
input clk,wren,rden,LOAD_N,EN,Reset_N;
input [3:0] address;
output [3:0] seg_sel;
output [7:0] seg_led;

wire [7:0]  DATA;

ramcounter ramcounter(
    .clk			(clk),
	 .address	(address),
	 .wren		(wren),
	 .rden		(rden),
	 .LOAD_N		(LOAD_N),
	 .Reset_N	(Reset_N),
	 .EN			(EN),
	 
	 .CNT			(DATA)
);

seg u_seg(
	.clk			(clk), // 系统时钟50MHz
	.sys_reset	(Reset_N), //复位按键
	.data			({8'd0,DATA}), //0~9999
	.point		(4'b0000),  //4位小数点
	
	.seg_sel		(seg_sel),  //位选
	.seg_led		(seg_led)   //段选

);

endmodule 