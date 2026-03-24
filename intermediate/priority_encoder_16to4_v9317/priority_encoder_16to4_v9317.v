`timescale 1ns/1ps
module priority_encoder_16to4 (
    input  [15:0] req,
    output reg [3:0] grant,
    output           valid
);
    assign valid = |req;
    integer i;
    always @(*) begin
        grant = 4'd0;
        for (i = 0; i < 16; i = i + 1)
            if (req[i]) grant = i[3:0];
    end
endmodule
