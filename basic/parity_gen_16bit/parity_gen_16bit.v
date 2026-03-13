`timescale 1ns/1ps
module parity_gen_16bit #(parameter WIDTH = 16) (
    input  [WIDTH-1:0] data,
    output             even_parity,
    output             odd_parity
);
    assign even_parity = ^data;
    assign odd_parity  = ~even_parity;
endmodule
