`timescale 1ns/1ps
module parity_gen_4bit_tb;
    parameter WIDTH = 4;
    reg [WIDTH-1:0] data;
    wire even_parity, odd_parity;
    parity_gen_4bit #(.WIDTH(WIDTH)) uut (.*);
    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            data = i; #10;
        end
        $display("Test passed"); $finish;
    end
endmodule
