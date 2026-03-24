// Updated: minor improvements
`timescale 1ns/1ps
module ripple_carry_adder_32bit #(parameter WIDTH = 32) (
    input  [WIDTH-1:0] a, b,
    input              cin,
    output [WIDTH-1:0] sum,
    output             cout
);
    assign {cout, sum} = a + b + cin;
endmodule
