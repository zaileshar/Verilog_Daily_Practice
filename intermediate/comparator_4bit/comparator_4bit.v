`timescale 1ns/1ps
module comparator_4bit #(parameter WIDTH = 4) (
    input  [WIDTH-1:0] a, b,
    output             eq, gt, lt
);
    assign eq = (a == b);
    assign gt = (a > b);
    assign lt = (a < b);
endmodule
