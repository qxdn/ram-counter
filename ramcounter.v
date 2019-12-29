module ramcounter(clk,address,wren,rden,LOAD_N,Reset_N,EN,CNT);
input clk,wren,rden,LOAD_N,EN,Reset_N;
input [3:0] address;
output [7:0] CNT;

wire clk1M;
wire clk1Hz;
wire [7:0] LoadData;

fdiv u_fdiv(
    .clk50M     (clk),
    .Reset_N    (Reset_N),

    .clk1M      (clk1M),
    .clk1Hz     (clk1Hz)
);

ram_2port u_ram(
    .clock      (clk1M),
    .data       (CNT),
    .rdaddress  (address),
    .rden       (rden),
    .wraddress  (address),
    .wren       (wren),

    .q          (LoadData)
);

counter u_counter(
    .CLK        (clk1Hz),
    .EN         (EN),
    .LOAD_N     (LOAD_N),
    .DATA       (LoadData),

    .CNT        (CNT)
);



endmodule 