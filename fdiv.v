module fdiv(clk50M,Reset_N,clk1M,clk1Hz);
input clk50M,Reset_N;  //时钟与复位
output reg clk1M,clk1Hz; 

reg [4:0] CNT1M;
//计数器最大值
localparam MaxDiv1M=5'd24;

reg [27:0] CNT1Hz;
localparam MaxDiv1Hz=28'd24_999_999;

//1Mhz
always @(posedge clk50M or negedge Reset_N) begin
    if(!Reset_N) begin
        clk1M<=1'b0;
        CNT1M<=5'd0;
    end else if (CNT1M<MaxDiv1M) begin
        CNT1M<=CNT1M+1'b1;
    end else begin
        CNT1M<=5'd0;
        clk1M<=~clk1M;
    end
end

//1Hz
always @(posedge clk50M or negedge Reset_N) begin
    if(!Reset_N) begin
        clk1Hz<=1'b0;
        CNT1Hz<=28'd0;
    end else if (CNT1Hz<MaxDiv1Hz) begin
        CNT1Hz<=CNT1Hz+1'b1;
    end else begin
        CNT1Hz<=28'd0;
        clk1Hz<=~clk1Hz;
    end
end

endmodule 