module d_flip_flop(
input D,
input clk,
output reg Q
);

initial Q = 1'b0;

always @(posedge clk) begin
Q <= D;
end

endmodule