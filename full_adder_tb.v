`timescale 1ns/1ps

module full_adder_tb;

reg A;
reg B;
reg CIN;
wire SUM;
wire COUT;

full_adder uut (
    .A(A),
    .B(B),
    .CIN(CIN),
    .SUM(SUM),
    .COUT(COUT)
);

initial begin

    $dumpfile("full_adder.vcd");
    $dumpvars(0, full_adder_tb);

    $display("==============================================");
    $display("             FULL ADDER TRUTH TABLE");
    $display("==============================================");
    $display(" Time(ns)   A   B   CIN   SUM   COUT");
    $display("----------------------------------------------");

    A=0; B=0; CIN=0;
    #10;
    $display("   %0t      %b   %b    %b     %b      %b",
             $time,A,B,CIN,SUM,COUT);

    A=0; B=0; CIN=1;
    #10;
    $display("   %0t      %b   %b    %b     %b      %b",
             $time,A,B,CIN,SUM,COUT);

    A=0; B=1; CIN=0;
    #10;
    $display("   %0t      %b   %b    %b     %b      %b",
             $time,A,B,CIN,SUM,COUT);

    A=0; B=1; CIN=1;
    #10;
    $display("   %0t      %b   %b    %b     %b      %b",
             $time,A,B,CIN,SUM,COUT);

    A=1; B=0; CIN=0;
    #10;
    $display("   %0t      %b   %b    %b     %b      %b",
             $time,A,B,CIN,SUM,COUT);

    A=1; B=0; CIN=1;
    #10;
    $display("   %0t      %b   %b    %b     %b      %b",
             $time,A,B,CIN,SUM,COUT);

    A=1; B=1; CIN=0;
    #10;
    $display("   %0t      %b   %b    %b     %b      %b",
             $time,A,B,CIN,SUM,COUT);

    A=1; B=1; CIN=1;
    #10;
    $display("   %0t      %b   %b    %b     %b      %b",
             $time,A,B,CIN,SUM,COUT);

    $display("==============================================");

    $finish;

end

endmodule