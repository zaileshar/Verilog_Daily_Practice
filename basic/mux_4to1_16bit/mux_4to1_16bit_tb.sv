`timescale 1ns/1ps
module mux_4to1_16bit_tb;
    parameter WIDTH = 16;
    reg [WIDTH-1:0] in0, in1, in2, in3;
    reg [1:0] sel;
    wire [WIDTH-1:0] y;
    mux_4to1_16bit #(.WIDTH(WIDTH)) uut (.*);
    integer i;
    initial begin
        in0 = 16'h1; in1 = 16'h2; in2 = 16'h3; in3 = 16'h4;
        for (i = 0; i < 4; i = i + 1) begin
            sel = i; #10;
        end
        $display("Test passed"); $finish;
    end
endmodule
