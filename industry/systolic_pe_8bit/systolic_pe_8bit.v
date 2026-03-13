`timescale 1ns/1ps
module systolic_pe_8bit #(parameter WIDTH = 8) (
    input                        clk, rst_n,
    input  signed [WIDTH-1:0]    a_in, b_in,
    input  signed [2*WIDTH-1:0]  c_in,
    output reg signed [WIDTH-1:0]    a_out, b_out,
    output reg signed [2*WIDTH-1:0]  c_out
);
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            a_out <= 0; b_out <= 0; c_out <= 0;
        end else begin
            a_out <= a_in;
            b_out <= b_in;
            c_out <= c_in + a_in * b_in;
        end
endmodule
