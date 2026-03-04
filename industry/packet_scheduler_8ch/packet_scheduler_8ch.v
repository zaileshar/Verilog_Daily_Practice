`timescale 1ns/1ps
module packet_scheduler_8ch #(parameter N = 8, parameter WIDTH = 8) (
    input                    clk, rst_n,
    input  [N-1:0]           req,
    input  [N*WIDTH-1:0]     data_in,
    output reg [WIDTH-1:0]   data_out,
    output reg               valid_out,
    output reg [$clog2(N)-1:0] sel_out
);
    reg [$clog2(N)-1:0] rr_ptr;
    integer i;
    reg found;
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            rr_ptr <= 0; valid_out <= 0; data_out <= 0; sel_out <= 0;
        end else begin
            valid_out <= 0; found = 0;
            for (i = 0; i < N; i = i + 1) begin
                if (!found && req[(rr_ptr + i) % N]) begin
                    sel_out <= (rr_ptr + i) % N;
                    data_out <= data_in[((rr_ptr+i)%N)*WIDTH +: WIDTH];
                    valid_out <= 1; found = 1;
                    rr_ptr <= ((rr_ptr + i) % N) + 1;
                end
            end
        end
endmodule
