`timescale 1ns/1ps
module d_flip_flop (
    input  clk, rst_n, d,
    output reg q
);
    always @(posedge clk or negedge rst_n)
        if (!rst_n) q <= 1'b0;
        else        q <= d;
endmodule
