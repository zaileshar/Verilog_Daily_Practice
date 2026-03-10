`timescale 1ns/1ps
module parity_gen_8bit #(parameter WIDTH = 8) (
    input  [WIDTH-1:0] data,
    output             even_parity,
    output             odd_parity
);
    assign even_parity = ^data;
    assign odd_parity  = ~even_parity;
endmodule
