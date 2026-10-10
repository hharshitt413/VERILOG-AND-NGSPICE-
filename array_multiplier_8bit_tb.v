`timescale 1ns/1ps
module array_multiplier_8bit_tb;
    reg [7:0] a, b;
    wire [15:0] p;

    array_multiplier_8bit uut (.a(a), .b(b), .p(p));

    initial begin
        $dumpfile("array_multiplier_8bit_tb.vcd");
        $dumpvars(0, array_multiplier_8bit_tb);
        $display("Time\t   A   B |     P");
        $display("-----------------------");

        a = 8'd0;   b = 8'd0;   #10;
        $display("%4dns %3d %3d | %5d", $time, a, b, p);

        a = 8'd1;   b = 8'd255; #10;
        $display("%4dns %3d %3d | %5d", $time, a, b, p);

        a = 8'd15;  b = 8'd15;  #10;
        $display("%4dns %3d %3d | %5d", $time, a, b, p);

        a = 8'd100; b = 8'd200; #10;
        $display("%4dns %3d %3d | %5d", $time, a, b, p);

        a = 8'd170; b = 8'd85;  #10;
        $display("%4dns %3d %3d | %5d", $time, a, b, p);

        a = 8'd255; b = 8'd255; #10;
        $display("%4dns %3d %3d | %5d", $time, a, b, p);

        $finish;
    end
endmodule