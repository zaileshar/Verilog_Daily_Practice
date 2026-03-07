`timescale 1ns/1ps
module mux_2to1_4bit #(parameter WIDTH = 4) (
    input  [WIDTH-1:0] a, b,
    input              sel,
    output [WIDTH-1:0] y
);
    assign y = sel ? b : a;
endmodule
