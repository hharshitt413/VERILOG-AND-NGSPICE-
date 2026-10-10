module sequential_multiplier_8bit(
    input clk,
    input rst,
    input start,
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] product,
    output reg done
);
    reg [15:0] multiplicand;
    reg [7:0]  multiplier;
    reg [3:0]  count;
    reg        busy;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            product      <= 0;
            multiplicand <= 0;
            multiplier   <= 0;
            count        <= 0;
            busy         <= 0;
            done         <= 0;
        end
        else if (start && !busy) begin
            product      <= 0;
            multiplicand <= a;
            multiplier   <= b;
            count        <= 0;
            busy         <= 1;
            done         <= 0;
        end
        else if (busy) begin
            if (multiplier[0])
                product <= product + multiplicand; // add
            multiplicand <= multiplicand << 1;     // shift left
            multiplier   <= multiplier >> 1;       // shift right
            count        <= count + 1;
            if (count == 7) begin
                busy <= 0;
                done <= 1;
            end
        end
    end
endmodule