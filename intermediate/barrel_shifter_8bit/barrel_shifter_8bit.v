`timescale 1ns/1ps
module barrel_shifter_8bit #(parameter WIDTH = 8) (
    input  [WIDTH-1:0]          data_in,
    input  [$clog2(WIDTH)-1:0]  shift_amt,
    input                       direction,
    output [WIDTH-1:0]          data_out
);
    assign data_out = direction ? (data_in >> shift_amt)
                                : (data_in << shift_amt);
endmodule
