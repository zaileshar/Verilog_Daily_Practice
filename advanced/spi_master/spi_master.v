`timescale 1ns/1ps
module spi_master #(parameter WIDTH = 8) (
    input              clk, rst_n,
    input  [WIDTH-1:0] tx_data,
    input              start,
    output reg         sclk, mosi, cs_n,
    input              miso,
    output reg [WIDTH-1:0] rx_data,
    output reg         done
);
    reg [3:0] bit_cnt;
    reg [1:0] state;
    reg [WIDTH-1:0] shift_tx, shift_rx;
    localparam IDLE = 0, ACTIVE = 1, FINISH = 2;
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            state <= IDLE; sclk <= 0; cs_n <= 1; mosi <= 0;
            done <= 0; bit_cnt <= 0;
        end else case (state)
            IDLE: begin
                done <= 0; sclk <= 0; cs_n <= 1;
                if (start) begin
                    shift_tx <= tx_data; cs_n <= 0; bit_cnt <= 0;
                    state <= ACTIVE;
                end
            end
            ACTIVE: begin
                sclk <= ~sclk;
                if (sclk == 0) begin
                    mosi <= shift_tx[WIDTH-1];
                end else begin
                    shift_rx <= {shift_rx[WIDTH-2:0], miso};
                    shift_tx <= shift_tx << 1;
                    if (bit_cnt == WIDTH - 1) state <= FINISH;
                    else bit_cnt <= bit_cnt + 1;
                end
            end
            FINISH: begin
                cs_n <= 1; sclk <= 0; done <= 1;
                rx_data <= shift_rx;
                state <= IDLE;
            end
        endcase
endmodule
