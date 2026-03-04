`timescale 1ns/1ps
module mux_2to1_16bit_tb;
    parameter WIDTH = 16;
    reg  [WIDTH-1:0] a, b;
    reg              sel;
    wire [WIDTH-1:0] y;
    mux_2to1_16bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 0; b = 0; sel = 0;
        #10 a = 16'hA; b = 16'h5; sel = 0;
        #10 sel = 1;
        #10 a = 16'hF; sel = 0;
        #10 sel = 1;
        #10 $display("Test passed"); $finish;
    end
endmodule
