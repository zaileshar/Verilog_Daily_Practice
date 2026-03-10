`timescale 1ns/1ps
module register_8bit #(parameter WIDTH = 8, parameter DEPTH = 8) (
    input                    clk, rst_n, wr_en,
    input  [$clog2(DEPTH)-1:0] addr,
    input  [WIDTH-1:0]       wr_data,
    output [WIDTH-1:0]       rd_data
);
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    integer i;
    assign rd_data = mem[addr];
    always @(posedge clk or negedge rst_n)
        if (!rst_n)
            for (i = 0; i < DEPTH; i = i + 1) mem[i] <= 0;
        else if (wr_en)
            mem[addr] <= wr_data;
endmodule
