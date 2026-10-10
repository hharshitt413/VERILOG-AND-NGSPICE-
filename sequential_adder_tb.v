`timescale 1ns/1ps

module sequential_adder_tb;

reg clk, rst, a_bit, b_bit;
wire sum_bit;

reg [3:0] A, B;
reg [4:0] result;
integer i;

sequential_adder uut(
    .clk(clk),
    .rst(rst),
    .a_bit(a_bit),
    .b_bit(b_bit),
    .sum_bit(sum_bit)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    a_bit = 0;
    b_bit = 0;

    A = 4'b1011;
    B = 4'b0110;

    #10 rst = 0;

    for (i = 0; i < 4; i = i + 1) begin
        a_bit = A[i];
        b_bit = B[i];

        #1;
        result[i] = sum_bit;

        $display("time=%0t bit=%0d a_bit=%b b_bit=%b carry_in=%b sum_bit=%b",
                 $time, i, a_bit, b_bit, uut.carry, sum_bit);

        @(posedge clk);
    end

    #1;
    result[4] = uut.carry;

    $display("Final Result A+B = %b (decimal %0d), A=%b(%0d) B=%b(%0d)",
             result, result, A, A, B, B);

    $finish;
end

endmodule