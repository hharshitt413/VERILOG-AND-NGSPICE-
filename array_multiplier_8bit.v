module array_multiplier_8bit(
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] p
);
    always @(*) begin
        p = a * b;
    end
endmodule