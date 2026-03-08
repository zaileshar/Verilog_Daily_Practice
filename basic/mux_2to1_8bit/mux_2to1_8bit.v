`timescale 1ns/1ps
module mux_2to1_8bit #(parameter WIDTH = 8) (
    input  [WIDTH-1:0] a, b,
    input              sel,
    output [WIDTH-1:0] y
);
    assign y = sel ? b : a;
endmodule
