`timescale 1ns/1ps
module counter_up_8bit #(parameter WIDTH = 8) (
    input                clk, rst_n, en,
    output reg [WIDTH-1:0] count
);
    always @(posedge clk or negedge rst_n)
        if (!rst_n)   count <= 0;
        else if (en)  count <= count + 1;
endmodule
