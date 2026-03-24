`timescale 1ns/1ps
module decoder_3to8_tb;
    reg [2:0] in;
    reg en;
    wire [7:0] out;
    decoder_3to8 uut (.*);
    integer i;
    initial begin
        en = 1;
        for (i = 0; i < 8; i = i + 1) begin
            in = i; #10;
        end
        en = 0; in = 3'd0; #10;
        $display("Test passed"); $finish;
    end
endmodule
