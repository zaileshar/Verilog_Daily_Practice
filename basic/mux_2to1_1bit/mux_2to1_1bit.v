`timescale 1ns/1ps
module mux_2to1_1bit #(parameter WIDTH = 1) (
    input  [WIDTH-1:0] a, b,
    input              sel,
    output [WIDTH-1:0] y
);
    assign y = sel ? b : a;
endmodule
