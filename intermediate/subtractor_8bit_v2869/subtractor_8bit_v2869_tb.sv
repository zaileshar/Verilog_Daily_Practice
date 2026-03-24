`timescale 1ns/1ps
module subtractor_8bit_tb;
    parameter WIDTH = 8;
    reg [WIDTH-1:0] a, b;
    wire [WIDTH-1:0] diff;
    wire borrow;
    subtractor_8bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 8'd20; b = 8'd5; #10;
        a = 8'd5; b = 8'd20; #10;
        a = 8'd100; b = 8'd100; #10;
        $display("Test passed"); $finish;
    end
endmodule
