`timescale 1ns/1ps

module dmux1to4_tb;

reg din;
reg [1:0] sel;
wire [3:0] y;

dmux1to4 uut (
    .din(din),
    .sel(sel),
    .y(y)
);

initial begin
    $dumpfile("dmux1to4.vcd");
    $dumpvars(0, dmux1to4_tb);

    din = 1'b1;

    sel = 2'b00;
    #10;

    sel = 2'b01;
    #10;

    sel = 2'b10;
    #10;

    sel = 2'b11;
    #10;

    din = 1'b0;

    sel = 2'b00;
    #10;

    sel = 2'b01;
    #10;

    sel = 2'b10;
    #10;

    sel = 2'b11;
    #10;

    $finish;
end

endmodule