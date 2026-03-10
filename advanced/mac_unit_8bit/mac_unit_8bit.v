`timescale 1ns/1ps
module mac_unit_8bit #(parameter WIDTH = 8) (
    input                    clk, rst_n, en,
    input  signed [WIDTH-1:0] a, b,
    output reg signed [2*WIDTH:0] acc
);
    always @(posedge clk or negedge rst_n)
        if (!rst_n)   acc <= 0;
        else if (en)  acc <= acc + (a * b);
endmodule
