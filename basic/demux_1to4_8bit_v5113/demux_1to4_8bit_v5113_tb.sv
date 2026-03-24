`timescale 1ns/1ps
module demux_1to4_8bit_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] data_in;
    reg [1:0] sel;
    wire [WIDTH-1:0] y0, y1, y2, y3;
    demux_1to4_8bit #(.WIDTH(WIDTH)) uut (.*);
    integer i;
    initial begin
        data_in = 8'hA;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i; #10;
        end
        $display("Test passed"); $finish;
    end
endmodule
