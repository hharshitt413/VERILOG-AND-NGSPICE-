    `timescale 1ns/1ps

    module NOT_gate_tb;

    reg A;
    wire Y;

    not_gate uut (
        .A(A),
        .Y(Y)
    );

    initial begin
        // Create waveform file
        $dumpfile("not_gate.vcd");
        $dumpvars(0, NOT_gate_tb);

        // Terminal heading
        $display("================================");
        $display("        NOT GATE TRUTH TABLE");
        $display("================================");
        $display(" Time(ns)   A   Y");
        $display("--------------------------------");

        A = 0;
        #10;
        $display("   %0t      %b   %b", $time, A, Y);

        A = 1;
        #10;
        $display("   %0t      %b   %b", $time, A, Y);

        $display("================================");

        $finish;
    end

    endmodule