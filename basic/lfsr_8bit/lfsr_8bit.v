`timescale 1ns/1ps
module lfsr_8bit #(parameter WIDTH = 8) (
    input                clk, rst_n, en,
    output reg [WIDTH-1:0] lfsr_out
);
    wire feedback = ^{lfsr_out[WIDTH-1], lfsr_out[WIDTH-2]};
    always @(posedge clk or negedge rst_n)
        if (!rst_n)       lfsr_out <= {WIDTH{1'b1}};
        else if (en)      lfsr_out <= {lfsr_out[WIDTH-2:0], feedback};
endmodule
