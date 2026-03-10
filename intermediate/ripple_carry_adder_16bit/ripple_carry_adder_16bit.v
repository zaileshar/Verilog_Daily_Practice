`timescale 1ns/1ps
module ripple_carry_adder_16bit #(parameter WIDTH = 16) (
    input  [WIDTH-1:0] a, b,
    input              cin,
    output [WIDTH-1:0] sum,
    output             cout
);
    assign {cout, sum} = a + b + cin;
endmodule
