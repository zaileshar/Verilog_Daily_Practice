`timescale 1ns/1ps
module spi_master_tb;
    reg clk, rst_n, start, miso;
    reg [7:0] tx_data;
    wire sclk_w, mosi_w, cs_n_w, done_w;
    wire [7:0] rx_data;
    spi_master #(.WIDTH(8)) uut (
        .clk(clk), .rst_n(rst_n), .tx_data(tx_data), .start(start),
        .sclk(sclk_w), .mosi(mosi_w), .cs_n(cs_n_w), .miso(miso),
        .rx_data(rx_data), .done(done_w)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0; rst_n = 0; start = 0; miso = 0; tx_data = 0;
        #12 rst_n = 1;
        tx_data = 8'hA5; start = 1; #10 start = 0;
        wait(done_w); #20;
        $display("Test passed"); $finish;
    end
endmodule
