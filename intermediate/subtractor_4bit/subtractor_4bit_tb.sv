`timescale 1ns/1ps
module subtractor_4bit_tb;
    parameter WIDTH = 4;
    reg [WIDTH-1:0] a, b;
    wire [WIDTH-1:0] diff;
    wire borrow;
    subtractor_4bit #(.WIDTH(WIDTH)) uut (.*);
    initial begin
        a = 4'd20; b = 4'd5; #10;
        a = 4'd5; b = 4'd20; #10;
        a = 4'd100; b = 4'd100; #10;
        $display("Test passed"); $finish;
    end
endmodule
