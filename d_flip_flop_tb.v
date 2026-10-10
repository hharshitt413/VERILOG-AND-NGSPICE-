`timescale 1ns/1ps

module d_flip_flop_tb;

reg D, clk;
wire Q;

d_flip_flop uut (.D(D), .clk(clk), .Q(Q));

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin

$dumpfile("d_flip_flop_tb.vcd");
$dumpvars(0, d_flip_flop_tb);

$display("Time\t D | Q");
$display("------------");

D = 0; #10;
$display("%4dns %b | %b", $time, D, Q);

D = 1; #10;
$display("%4dns %b | %b", $time, D, Q);

D = 0; #10;
$display("%4dns %b | %b", $time, D, Q);

D = 1; #10;
$display("%4dns %b | %b", $time, D, Q);

D = 0; #10;
$display("%4dns %b | %b", $time, D, Q);

$finish;

end

endmodule