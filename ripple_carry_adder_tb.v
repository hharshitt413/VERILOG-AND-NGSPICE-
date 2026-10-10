`timescale 1ns/1ps

module ripple_carry_adder_tb;

reg [3:0] A;
reg [3:0] B;
reg CIN;

wire [3:0] SUM;
wire COUT;

ripple_carry_adder uut (
    .A(A),
    .B(B),
    .CIN(CIN),
    .SUM(SUM),
    .COUT(COUT)
);

initial begin

    $dumpfile("ripple_carry_adder.vcd");
    $dumpvars(0, ripple_carry_adder_tb);

    $display("==============================================");
    $display("       4-BIT RIPPLE CARRY ADDER");
    $display("==============================================");
    $display(" Time    A       B      CIN    COUT    SUM");
    $display("----------------------------------------------");

    A=4'b0000; B=4'b0000; CIN=0;
    #10;
    $display(" %0t    %b    %b      %b       %b     %b",
             $time,A,B,CIN,COUT,SUM);

    A=4'b0001; B=4'b0010; CIN=0;
    #10;
    $display(" %0t    %b    %b      %b       %b     %b",
             $time,A,B,CIN,COUT,SUM);

    A=4'b0011; B=4'b0100; CIN=0;
    #10;
    $display(" %0t    %b    %b      %b       %b     %b",
             $time,A,B,CIN,COUT,SUM);

    A=4'b0101; B=4'b0011; CIN=0;
    #10;
    $display(" %0t    %b    %b      %b       %b     %b",
             $time,A,B,CIN,COUT,SUM);

    A=4'b0111; B=4'b0001; CIN=0;
    #10;
    $display(" %0t    %b    %b      %b       %b     %b",
             $time,A,B,CIN,COUT,SUM);

    A=4'b1111; B=4'b0001; CIN=0;
    #10;
    $display(" %0t    %b    %b      %b       %b     %b",
             $time,A,B,CIN,COUT,SUM);

    A=4'b1010; B=4'b0101; CIN=1;
    #10;
    $display(" %0t    %b    %b      %b       %b     %b",
             $time,A,B,CIN,COUT,SUM);

    A=4'b1111; B=4'b1111; CIN=1;
    #10;
    $display(" %0t    %b    %b      %b       %b     %b",
             $time,A,B,CIN,COUT,SUM);

    $display("==============================================");

    $finish;
end

endmodule