`timescale 1ns/1ps

module tb;

reg D0, D1, D2, D3, D4, D5, D6, D7;
wire Y2, Y1, Y0;

encoder8to3 uut (
    .D0(D0),
    .D1(D1),
    .D2(D2),
    .D3(D3),
    .D4(D4),
    .D5(D5),
    .D6(D6),
    .D7(D7),
    .Y2(Y2),
    .Y1(Y1),
    .Y0(Y0)
);

initial begin

$dumpfile("dump.vcd");
$dumpvars(0, tb);

$display("-------------------------------------------------------------");
$display("D7 D6 D5 D4 D3 D2 D1 D0 | Y2 Y1 Y0");
$display("-------------------------------------------------------------");

$monitor("%b %b %b %b %b %b %b %b | %b %b %b",
         D7, D6, D5, D4, D3, D2, D1, D0,
         Y2, Y1, Y0);

D7=0; D6=0; D5=0; D4=0; D3=0; D2=0; D1=0; D0=1; #10;
D0=0; D1=1; #10;
D1=0; D2=1; #10;
D2=0; D3=1; #10;
D3=0; D4=1; #10;
D4=0; D5=1; #10;
D5=0; D6=1; #10;
D6=0; D7=1; #10;

$finish;

end

endmodule