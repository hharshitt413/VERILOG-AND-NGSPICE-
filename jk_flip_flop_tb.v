`timescale 1ns/1ps

module jk_flip_flop_tb;

reg J, K, clk;
wire Q;

jk_flip_flop uut (.J(J), .K(K), .clk(clk), .Q(Q));

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin

$dumpfile("jk_flip_flop_tb.vcd");
$dumpvars(0, jk_flip_flop_tb);

$display("Time\t J K | Q");
$display("----------------");

J = 0; K = 0; #10;
$display("%4dns %b %b | %b", $time, J, K, Q);

J = 0; K = 1; #10;
$display("%4dns %b %b | %b", $time, J, K, Q);

J = 1; K = 0; #10;
$display("%4dns %b %b | %b", $time, J, K, Q);

J = 1; K = 1; #10;
$display("%4dns %b %b | %b", $time, J, K, Q);

J = 1; K = 1; #10;
$display("%4dns %b %b | %b", $time, J, K, Q);

J = 0; K = 0; #10;
$display("%4dns %b %b | %b", $time, J, K, Q);

$finish;

end

endmodule