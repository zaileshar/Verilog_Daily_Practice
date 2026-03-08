`timescale 1ns/1ps
module uart_tx #(parameter CLK_FREQ = 50000000, parameter BAUD = 115200) (
    input            clk, rst_n,
    input  [7:0]     tx_data,
    input            tx_start,
    output reg       tx_out,
    output reg       tx_busy
);
    localparam CLKS_PER_BIT = CLK_FREQ / BAUD;
    reg [15:0] clk_count;
    reg [3:0]  bit_idx;
    reg [1:0]  state;
    reg [7:0]  shift_reg;
    localparam IDLE = 0, START = 1, DATA = 2, STOP = 3;
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            state <= IDLE; tx_out <= 1; tx_busy <= 0;
            clk_count <= 0; bit_idx <= 0;
        end else case (state)
            IDLE: begin
                tx_out <= 1; tx_busy <= 0;
                if (tx_start) begin
                    shift_reg <= tx_data;
                    state <= START; tx_busy <= 1; clk_count <= 0;
                end
            end
            START: begin
                tx_out <= 0;
                if (clk_count == CLKS_PER_BIT - 1) begin
                    clk_count <= 0; bit_idx <= 0; state <= DATA;
                end else clk_count <= clk_count + 1;
            end
            DATA: begin
                tx_out <= shift_reg[bit_idx];
                if (clk_count == CLKS_PER_BIT - 1) begin
                    clk_count <= 0;
                    if (bit_idx == 7) state <= STOP;
                    else bit_idx <= bit_idx + 1;
                end else clk_count <= clk_count + 1;
            end
            STOP: begin
                tx_out <= 1;
                if (clk_count == CLKS_PER_BIT - 1) begin
                    state <= IDLE; tx_busy <= 0;
                end else clk_count <= clk_count + 1;
            end
        endcase
endmodule
