`timescale 1ns/1ps
module mux_2to1_4bit_tb;
    parameter WIDTH = 4;
    reg  [WIDTH-1:0] a, b;
    reg              sel;
    wire [WIDTH-1:0] y;
    mux_2to1_4bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 0; b = 0; sel = 0;
        #10 a = 4'hA; b = 4'h5; sel = 0;
        #10 sel = 1;
        #10 a = 4'hF; sel = 0;
        #10 sel = 1;
        #10 $display("Test passed"); $finish;
    end
endmodule
