module counter(CLK,EN,LOAD_N,DATA,CNT);
input CLK,EN,LOAD_N;
input [7:0] DATA;
output reg [7:0] CNT;

initial begin
	CNT<=8'd0;
end

//异步置位 同步复位
always @(posedge CLK or negedge LOAD_N) begin
    if (!LOAD_N) begin
        CNT<=DATA;  
    end else if(EN) begin
		 if(CNT==8'd255) begin
			CNT<=8'd0;
		 end else begin
        CNT<=CNT+1'b1;
		 end
    end
end

endmodule
  