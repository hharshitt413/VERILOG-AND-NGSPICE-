`timescale 1ns/1ps

module exp9_tb;

reg clk, rst;
wire [3:0] q;

bcd_counter uut(.clk(clk), .rst(rst), .q(q));

always #5 clk = ~clk;

integer i;

initial begin
    clk = 0;
    rst = 1;
    #10;

    rst = 0;

    for (i = 0; i < 13; i = i + 1) begin
        @(posedge clk);
        #1;
        $display("time=%0t q=%b (%0d)", $time, q, q);
    end

    $finish;
end

endmodule