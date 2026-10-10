`timescale 1ns/1ps

module tb;

reg I0, I1, I2, I3, I4, I5, I6, I7;
wire Y2, Y1, Y0;

priority_encoder8to3 uut (
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .I4(I4),
    .I5(I5),
    .I6(I6),
    .I7(I7),
    .Y2(Y2),
    .Y1(Y1),
    .Y0(Y0)
);

initial begin

$dumpfile("dump.vcd");
$dumpvars(0, tb);

$display("-------------------------------------------------------------");
$display("I7 I6 I5 I4 I3 I2 I1 I0 | Y2 Y1 Y0");
$display("-------------------------------------------------------------");

$monitor("%b %b %b %b %b %b %b %b | %b %b %b",
         I7, I6, I5, I4, I3, I2, I1, I0,
         Y2, Y1, Y0);

// No input active
I7=0; I6=0; I5=0; I4=0; I3=0; I2=0; I1=0; I0=0; #10;

// One input active at a time
I0=1; #10;
I0=0; I1=1; #10;
I1=0; I2=1; #10;
I2=0; I3=1; #10;
I3=0; I4=1; #10;
I4=0; I5=1; #10;
I5=0; I6=1; #10;
I6=0; I7=1; #10;

$finish;

end

endmodule