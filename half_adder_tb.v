`timescale 1ns/1ps

module half_adder_tb;

reg A;
reg B;
wire SUM;
wire CARRY;

half_adder uut (
    .A(A),
    .B(B),
    .SUM(SUM),
    .CARRY(CARRY)
);

initial begin

    // Create waveform file
    $dumpfile("half_adder.vcd");
    $dumpvars(0, half_adder_tb);

    // Terminal truth table
    $display("==========================================");
    $display("          HALF ADDER TRUTH TABLE");
    $display("==========================================");
    $display(" Time(ns)   A   B   SUM   CARRY");
    $display("------------------------------------------");

    A = 0; B = 0;
    #10;
    $display("   %0t      %b   %b    %b      %b",
             $time, A, B, SUM, CARRY);

    A = 0; B = 1;
    #10;
    $display("   %0t      %b   %b    %b      %b",
             $time, A, B, SUM, CARRY);

    A = 1; B = 0;
    #10;
    $display("   %0t      %b   %b    %b      %b",
             $time, A, B, SUM, CARRY);

    A = 1; B = 1;
    #10;
    $display("   %0t      %b   %b    %b      %b",
             $time, A, B, SUM, CARRY);

    $display("==========================================");

    $finish;

end

endmodule