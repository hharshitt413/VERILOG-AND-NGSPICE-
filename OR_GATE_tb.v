`timescale 1ps/1ps
module OR_GATE_tb;

reg A;
reg B;
wire Y;

OR_GATE uut(
    .A(A),
    .B(B),
    .Y(Y)
);

initial begin 
$dumpfile("OR_GATE.vcd");
$dumpvars(0,OR_GATE_tb);

$display("================================");
    $display("       OR GATE TRUTH TABLE");
    $display("================================");
    $display(" Time(ns)   A   B   Y");
    $display("--------------------------------");

    A = 0; B = 0;
    #10;
    $display("   %0t      %b   %b   %b", $time, A, B, Y);

    A = 0; B = 1;
    #10;
    $display("   %0t      %b   %b   %b", $time, A, B, Y);

    A = 1; B = 0;
    #10;
    $display("   %0t      %b   %b   %b", $time, A, B, Y);

    A = 1; B = 1;
    #10;
    $display("   %0t      %b   %b   %b", $time, A, B, Y);

    $display("================================");
  $finish;
end
endmodule