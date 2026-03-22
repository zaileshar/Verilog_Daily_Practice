`timescale 1ns/1ps
module encoder_8to3_tb;
    reg [7:0] in;
    wire [2:0] out;
    wire valid;
    encoder_8to3 uut (.*);
    integer i;
    initial begin
        in = 0; #10;
        for (i = 0; i < 8; i = i + 1) begin
            in = (1 << i); #10;
        end
        $display("Test passed"); $finish;
    end
endmodule
