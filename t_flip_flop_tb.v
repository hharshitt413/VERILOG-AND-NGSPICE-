`timescale 1ns/1ps

module t_flip_flop_tb;

reg T, clk;
wire Q;

t_flip_flop uut (.T(T), .clk(clk), .Q(Q));

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin

$dumpfile("t_flip_flop_tb.vcd");
$dumpvars(0, t_flip_flop_tb);

$display("Time\t T | Q");
$display("------------");

T = 0; #10;
$display("%4dns %b | %b", $time, T, Q);

T = 1; #10;
$display("%4dns %b | %b", $time, T, Q);

T = 1; #10;
$display("%4dns %b | %b", $time, T, Q);

T = 0; #10;
$display("%4dns %b | %b", $time, T, Q);

T = 1; #10;
$display("%4dns %b | %b", $time, T, Q);

T = 0; #10;
$display("%4dns %b | %b", $time, T, Q);

$finish;

end

endmodule