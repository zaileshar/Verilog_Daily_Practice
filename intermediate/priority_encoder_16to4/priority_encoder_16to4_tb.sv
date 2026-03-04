`timescale 1ns/1ps
module priority_encoder_16to4_tb;
    reg [15:0] req;
    wire [3:0] grant;
    wire valid;
    priority_encoder_16to4 uut (.*);
    initial begin
        req = 16'h0000; #10;
        req = 16'h0001; #10;
        req = 16'h0080; #10;
        req = 16'h8000; #10;
        req = 16'hFF00; #10;
        $display("Test passed"); $finish;
    end
endmodule
