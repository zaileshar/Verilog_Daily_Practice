`timescale 1ns/1ps
module clock_divider_by4 #(parameter DIV = 4) (
    input      clk_in, rst_n,
    output reg clk_out
);
    reg [$clog2(DIV)-1:0] count;
    always @(posedge clk_in or negedge rst_n)
        if (!rst_n) begin
            count   <= 0;
            clk_out <= 0;
        end else if (count == DIV/2 - 1) begin
            count   <= 0;
            clk_out <= ~clk_out;
        end else
            count <= count + 1;
endmodule
