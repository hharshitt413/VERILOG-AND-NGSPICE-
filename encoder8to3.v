module encoder8to3(
input D0,
input D1,
input D2,
input D3,
input D4,
input D5,
input D6,
input D7,
output reg Y2,
output reg Y1,
output reg Y0
);

always @(*) begin

case ({D7, D6, D5, D4, D3, D2, D1, D0})

8'b00000001: {Y2, Y1, Y0} = 3'b000;
8'b00000010: {Y2, Y1, Y0} = 3'b001;
8'b00000100: {Y2, Y1, Y0} = 3'b010;
8'b00001000: {Y2, Y1, Y0} = 3'b011;
8'b00010000: {Y2, Y1, Y0} = 3'b100;
8'b00100000: {Y2, Y1, Y0} = 3'b101;
8'b01000000: {Y2, Y1, Y0} = 3'b110;
8'b10000000: {Y2, Y1, Y0} = 3'b111;

default: {Y2, Y1, Y0} = 3'b000;

endcase

end

endmodule