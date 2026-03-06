`timescale 1ns/1ps
module alu_32bit #(parameter WIDTH = 32) (
    input  [WIDTH-1:0] a, b,
    input  [3:0]       op,
    output reg [WIDTH-1:0] result,
    output             zero
);
    assign zero = (result == 0);
    always @(*) begin
        case (op)
            4'h0: result = a + b;
            4'h1: result = a - b;
            4'h2: result = a & b;
            4'h3: result = a | b;
            4'h4: result = a ^ b;
            4'h5: result = ~a;
            4'h6: result = a << 1;
            4'h7: result = a >> 1;
            default: result = 0;
        endcase
    end
endmodule
