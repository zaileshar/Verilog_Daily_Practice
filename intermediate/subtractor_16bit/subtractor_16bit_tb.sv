`timescale 1ns/1ps
module subtractor_16bit_tb;
    parameter WIDTH = 16;
    reg [WIDTH-1:0] a, b;
    wire [WIDTH-1:0] diff;
    wire borrow;
    subtractor_16bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 16'd20; b = 16'd5; #10;
        a = 16'd5; b = 16'd20; #10;
        a = 16'd100; b = 16'd100; #10;
        $display("Test passed"); $finish;
    end
endmodule
