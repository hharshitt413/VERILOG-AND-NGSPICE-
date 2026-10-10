`timescale 1ns/1ps

module mux4to1_tb;

reg I0, I1, I2, I3;
reg S0, S1;

wire Y;

mux4to1 uut (
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .S0(S0),
    .S1(S1),
    .Y(Y)
);

initial begin

    $dumpfile("mux4to1.vcd");
    $dumpvars(0, mux4to1_tb);

    $display("==============================================");
    $display("              4:1 MULTIPLEXER");
    $display("==============================================");
    $display(" S1  S0   I0 I1 I2 I3     Y");
    $display("----------------------------------------------");

    // I0 selected
    I0=1; I1=0; I2=0; I3=0;
    S1=0; S0=0;
    #10;
    $display("  %b   %b     %b  %b  %b  %b      %b",
             S1,S0,I0,I1,I2,I3,Y);

    // I1 selected
    I0=0; I1=1; I2=0; I3=0;
    S1=0; S0=1;
    #10;
    $display("  %b   %b     %b  %b  %b  %b      %b",
             S1,S0,I0,I1,I2,I3,Y);

    // I2 selected
    I0=0; I1=0; I2=1; I3=0;
    S1=1; S0=0;
    #10;
    $display("  %b   %b     %b  %b  %b  %b      %b",
             S1,S0,I0,I1,I2,I3,Y);

    // I3 selected
    I0=0; I1=0; I2=0; I3=1;
    S1=1; S0=1;
    #10;
    $display("  %b   %b     %b  %b  %b  %b      %b",
             S1,S0,I0,I1,I2,I3,Y);

    $display("==============================================");

    $finish;

end

endmodule