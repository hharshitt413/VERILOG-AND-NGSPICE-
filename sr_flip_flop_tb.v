`timescale 1ns/1ps

module sr_flip_flop_tb;

reg S, R, clk;
wire Q;

sr_flip_flop uut (.S(S), .R(R), .clk(clk), .Q(Q));

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin

$dumpfile("sr_flip_flop_tb.vcd");
$dumpvars(0, sr_flip_flop_tb);

$display("Time\t S R | Q");
$display("----------------");

S = 0; R = 0; #10;
$display("%4dns %b %b | %b", $time, S, R, Q);

S = 1; R = 0; #10;
$display("%4dns %b %b | %b", $time, S, R, Q);

S = 0; R = 1; #10;
$display("%4dns %b %b | %b", $time, S, R, Q);

S = 0; R = 0; #10;
$display("%4dns %b %b | %b", $time, S, R, Q);

S = 1; R = 1; #10;
$display("%4dns %b %b | %b", $time, S, R, Q);

$finish;

end

endmodule