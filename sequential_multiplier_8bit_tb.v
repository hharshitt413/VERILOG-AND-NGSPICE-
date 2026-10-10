`timescale 1ns/1ps
module sequential_multiplier_8bit_tb;
    reg clk, rst, start;
    reg [7:0] a, b;
    reg [15:0] expected;
    wire [15:0] product;
    wire done;

    sequential_multiplier_8bit uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .a(a),
        .b(b),
        .product(product),
        .done(done)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    task run_test;
        input [7:0] x;
        input [7:0] y;
        begin
            @(negedge clk);
            a = x; b = y; expected = x * y;
            start = 1;
            @(negedge clk);
            start = 0;
            wait (done == 1);
            #1;
            $display("A=%0d, B=%0d, Product=%0d, Expected=%0d, Status=%s",
                     x, y, product, expected, (product == expected) ? "PASS" : "FAIL");
            @(negedge clk);
        end
    endtask

    initial begin
        $dumpfile("sequential_multiplier_8bit_tb.vcd");
        $dumpvars(0, sequential_multiplier_8bit_tb);
        rst = 1; start = 0; a = 0; b = 0; expected = 0;
        repeat (2) @(negedge clk);
        rst = 0;

        run_test(8'd3,   8'd5);
        run_test(8'd15,  8'd15);
        run_test(8'd100, 8'd200);
        run_test(8'd170, 8'd85);
        run_test(8'd255, 8'd255);

        $finish;
    end
endmodule