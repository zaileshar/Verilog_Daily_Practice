`timescale 1ns/1ps
module pwm_gen_10bit #(parameter WIDTH = 10) (
    input              clk, rst_n,
    input  [WIDTH-1:0] duty,
    output reg         pwm_out
);
    reg [WIDTH-1:0] counter;
    always @(posedge clk or negedge rst_n)
        if (!rst_n) begin
            counter <= 0;
            pwm_out <= 0;
        end else begin
            counter <= counter + 1;
            pwm_out <= (counter < duty);
        end
endmodule
