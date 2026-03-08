`timescale 1ns/1ps
module mux_2to1_32bit_tb;
    parameter WIDTH = 32;
    reg  [WIDTH-1:0] a, b;
    reg              sel;
    wire [WIDTH-1:0] y;
    mux_2to1_32bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 0; b = 0; sel = 0;
        #10 a = 32'hA; b = 32'h5; sel = 0;
        #10 sel = 1;
        #10 a = 32'hF; sel = 0;
        #10 sel = 1;
        #10 $display("Test passed"); $finish;
    end
endmodule
