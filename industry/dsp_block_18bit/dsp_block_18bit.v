`timescale 1ns/1ps
module dsp_block_18bit #(parameter WIDTH = 18) (
    input                        clk, rst_n, en,
    input  signed [WIDTH-1:0]    a, b, c,
    input  [1:0]                 mode,
    output reg signed [2*WIDTH:0] result
);
    // mode: 00 = A*B, 01 = A*B+C, 10 = A+B, 11 = A-B
    always @(posedge clk or negedge rst_n)
        if (!rst_n) result <= 0;
        else if (en) case (mode)
            2'b00: result <= a * b;
            2'b01: result <= a * b + c;
            2'b10: result <= a + b;
            2'b11: result <= a - b;
        endcase
endmodule
