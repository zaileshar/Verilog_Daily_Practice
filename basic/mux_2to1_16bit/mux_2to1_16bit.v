//----------------------------------------------
// Module : mux_2to1_16bit
// Author : Hardware Design Agent
// Description : Auto-generated RTL module
//----------------------------------------------

`timescale 1ns/1ps
module mux_2to1_16bit #(parameter WIDTH = 16) (
    input  [WIDTH-1:0] a, b,
    input              sel,
    output [WIDTH-1:0] y
);
    assign y = sel ? b : a;
endmodule
