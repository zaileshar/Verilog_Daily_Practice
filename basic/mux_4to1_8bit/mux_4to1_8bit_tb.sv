`timescale 1ns/1ps
module mux_4to1_8bit_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] in0, in1, in2, in3;
    reg [1:0] sel;
    wire [WIDTH-1:0] y;
    mux_4to1_8bit #(.WIDTH(WIDTH)) uut (.*);
    integer i;
    initial begin
        in0 = 8'h1; in1 = 8'h2; in2 = 8'h3; in3 = 8'h4;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i; #10;
        end
        $display("Test passed"); $finish;
    end
endmodule
