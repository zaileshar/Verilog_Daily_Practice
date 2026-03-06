`timescale 1ns/1ps
module array_multiplier_8bit #(parameter WIDTH = 8) (
    input  [WIDTH-1:0]     a, b,
    output [2*WIDTH-1:0]   product
);
    assign product = a * b;
endmodule
