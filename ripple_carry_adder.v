module ripple_carry_adder(
    input [3:0]A,
    input[3:0] B,
    input CIN,
    output reg[3:0]SUM,
    output reg COUT
);

always @(*) begin
    {COUT,SUM}=A+B+CIN;
end
endmodule