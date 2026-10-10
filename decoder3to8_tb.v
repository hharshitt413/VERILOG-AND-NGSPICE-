`timescale 1ns/1ps

module tb;

reg A, B, C;
wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

decoder3to8 uut (
    .A(A),
    .B(B),
    .C(C),
    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3),
    .Y4(Y4),
    .Y5(Y5),
    .Y6(Y6),
    .Y7(Y7)
);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    $display("------------------------------------------------------------");
    $display("A B C | Y0 Y1 Y2 Y3 Y4 Y5 Y6 Y7");
    $display("------------------------------------------------------------");

    $monitor("%b %b %b | %b  %b  %b  %b  %b  %b  %b  %b",
             A, B, C, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);

    A=0; B=0; C=0; #10;
    A=0; B=0; C=1; #10;
    A=0; B=1; C=0; #10;
    A=0; B=1; C=1; #10;
    A=1; B=0; C=0; #10;
    A=1; B=0; C=1; #10;
    A=1; B=1; C=0; #10;
    A=1; B=1; C=1; #10;

    $finish;

end

endmodule