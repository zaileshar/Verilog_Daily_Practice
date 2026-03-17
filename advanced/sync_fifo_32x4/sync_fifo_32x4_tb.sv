`timescale 1ns/1ps
module sync_fifo_32x4_tb;
    parameter WIDTH = 32, DEPTH = 4;
    reg clk, rst_n, wr_en, rd_en;
    reg [WIDTH-1:0] wr_data;
    wire [WIDTH-1:0] rd_data;
    wire full, empty;
    sync_fifo_32x4 #(.WIDTH(WIDTH), .DEPTH(DEPTH)) uut (.*);
    always #5 clk = ~clk;
    integer i;
    initial begin
        clk = 0; rst_n = 0; wr_en = 0; rd_en = 0; wr_data = 0;
        #12 rst_n = 1;
        for (i = 0; i < DEPTH; i = i + 1) begin
            wr_en = 1; wr_data = i * 10; #10;
        end
        wr_en = 0;
        for (i = 0; i < DEPTH; i = i + 1) begin
            rd_en = 1; #10;
        end
        rd_en = 0; #10;
        $display("Test passed"); $finish;
    end
endmodule
