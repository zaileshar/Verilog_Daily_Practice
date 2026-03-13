`timescale 1ns/1ps
module sync_fifo_16x8 #(parameter WIDTH = 16, parameter DEPTH = 8) (
    input                clk, rst_n,
    input                wr_en, rd_en,
    input  [WIDTH-1:0]   wr_data,
    output [WIDTH-1:0]   rd_data,
    output               full, empty
);
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [$clog2(DEPTH):0] wr_ptr, rd_ptr;
    assign rd_data = mem[rd_ptr[$clog2(DEPTH)-1:0]];
    assign full  = (wr_ptr[$clog2(DEPTH)] != rd_ptr[$clog2(DEPTH)]) &&
                   (wr_ptr[$clog2(DEPTH)-1:0] == rd_ptr[$clog2(DEPTH)-1:0]);
    assign empty = (wr_ptr == rd_ptr);
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            wr_ptr <= 0; rd_ptr <= 0;
        end else begin
            if (wr_en && !full) begin
                mem[wr_ptr[$clog2(DEPTH)-1:0]] <= wr_data;
                wr_ptr <= wr_ptr + 1;
            end
            if (rd_en && !empty)
                rd_ptr <= rd_ptr + 1;
        end
endmodule
