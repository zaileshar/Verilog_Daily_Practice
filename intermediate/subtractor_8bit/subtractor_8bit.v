`default_nettype none
//----------------------------------------------
// Module : subtractor_8bit
// Author : Hardware Design Agent
// Description : Auto-generated RTL module
//----------------------------------------------

`default_nettype none
`timescale 1ns/1ps
module subtractor_8bit #(parameter WIDTH = 8) (
    input  [WIDTH-1:0] a, b,
    output [WIDTH-1:0] diff,
    output             borrow
);
    assign {borrow, diff} = a - b;
endmodule

`default_nettype wire

`default_nettype wire
