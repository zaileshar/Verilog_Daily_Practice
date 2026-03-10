`timescale 1ns/1ps
module register_8bit_tb;
    parameter WIDTH = 8, DEPTH = 8;
    reg clk, rst_n, wr_en;
    reg [$clog2(DEPTH)-1:0] addr;
    reg [WIDTH-1:0] wr_data;
    wire [WIDTH-1:0] rd_data;
    register_8bit #(.WIDTH(WIDTH), .DEPTH(DEPTH)) uut (.*);
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst_n = 0; wr_en = 0; addr = 0; wr_data = 0;
        #12 rst_n = 1;
        wr_en = 1; addr = 0; wr_data = 8'hAB; #10;
        addr = 1; wr_data = 8'hCD; #10;
        wr_en = 0; addr = 0; #10;
        addr = 1; #10;
        $display("Test passed"); $finish;
    end
endmodule
