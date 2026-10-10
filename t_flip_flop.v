module t_flip_flop(
input T,
input clk,
output reg Q
);

initial Q = 1'b0;

always @(posedge clk) begin
if (T)
Q <= ~Q; // Toggle
else
Q <= Q; // No change
end

endmodule