`default_nettype none
`timescale 1ns/1ps
module mux_4to1_8bit #(parameter WIDTH = 8) (
    input  [WIDTH-1:0] in0, in1, in2, in3,
    input  [1:0]       sel,
    output reg [WIDTH-1:0] y
);
    always @(*) begin
        case (sel)
            2'b00: y = in0;
            2'b01: y = in1;
            2'b10: y = in2;
            2'b11: y = in3;
        endcase
    end
endmodule

`default_nettype wire
