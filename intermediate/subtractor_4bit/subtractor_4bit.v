`timescale 1ns/1ps
module subtractor_4bit #(parameter WIDTH = 4) (
    input  [WIDTH-1:0] a, b,
    output [WIDTH-1:0] diff,
    output             borrow
);
    assign {borrow, diff} = a - b;
endmodule
