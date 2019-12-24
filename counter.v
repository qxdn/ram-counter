module counter(CLK,RESET_N,EN,LOAD_N,DATA,CNT,COUT);
input CLK,RESET_N,EN,LOAD_N;
input [3:0] DATA;
output reg [3:0] CNT;
output reg COUT;

always @(posedge CLK or negedge RESET_N) begin
    if (!RESET_N) begin
        CNT<=4'd0;  //复位
        COUT<=1'b0;
    end else if(EN) begin //使能
        if (!LOAD_N) begin
            CNT<=DATA;
        end else if(CNT<4'd7) begin
            CNT<=CNT+1'b1;
            COUT<=1'b0;
        end else begin
            CNT<=4'd0;
            COUT<=1'b1;
        end
    end
end




endmodule  