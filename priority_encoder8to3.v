module priority_encoder8to3(
input I0,
input I1,
input I2,
input I3,
input I4,
input I5,
input I6,
input I7,
output reg Y2,
output reg Y1,
output reg Y0
);

always @(*) begin

if (I7) {Y2, Y1, Y0} = 3'b111;
else if (I6) {Y2, Y1, Y0} = 3'b110;
else if (I5) {Y2, Y1, Y0} = 3'b101;
else if (I4) {Y2, Y1, Y0} = 3'b100;
else if (I3) {Y2, Y1, Y0} = 3'b011;
else if (I2) {Y2, Y1, Y0} = 3'b010;
else if (I1) {Y2, Y1, Y0} = 3'b001;
else {Y2, Y1, Y0} = 3'b000;

end

endmodule