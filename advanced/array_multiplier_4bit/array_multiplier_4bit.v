`timescale 1ns/1ps
module array_multiplier_4bit #(parameter WIDTH = 4) (
    input  [WIDTH-1:0]     a, b,
    output [2*WIDTH-1:0]   product
);
    assign product = a * b;
endmodule
