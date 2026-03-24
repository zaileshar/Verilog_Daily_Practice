`timescale 1ns/1ps
module ripple_carry_adder_4bit #(parameter WIDTH = 4) (
    input  [WIDTH-1:0] a, b,
    input              cin,
    output [WIDTH-1:0] sum,
    output             cout
);
    assign {cout, sum} = a + b + cin;
// synthesis translate_off
// synthesis translate_on
endmodule
