`timescale 1ns/1ps
module encoder_8to3 (
    input  [7:0] in,
    output reg [2:0] out,
    output           valid
);
    assign valid = |in;
    always @(*) begin
        casez (in)
            8'b1???????: out = 3'd7;
            8'b01??????: out = 3'd6;
            8'b001?????: out = 3'd5;
            8'b0001????: out = 3'd4;
            8'b00001???: out = 3'd3;
            8'b000001??: out = 3'd2;
            8'b0000001?: out = 3'd1;
            8'b00000001: out = 3'd0;
            default:     out = 3'd0;
        endcase
    end
endmodule
