`timescale 1ns/1ps

module xnor_gate_tb;

reg A;
reg B;
wire Y;

xnor_gate uut (
    .A(A),
    .B(B),
    .Y(Y)
);

initial begin

    $dumpfile("xnor_gate.vcd");
    $dumpvars(0, xnor_gate_tb);

    $display("================================");
    $display("       XNOR GATE TRUTH TABLE");
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