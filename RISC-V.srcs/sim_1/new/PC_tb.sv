`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:21:23 PM
// Design Name: 
// Module Name: PC_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module PC_tb;

parameter pc_len = 32;

logic clk;
logic reset;
logic [pc_len-1:0] pc;

Program_counter #(
    .pc_len(pc_len)
) uut (
    .clk(clk),
    .reset(reset),
    .pc(pc)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    #10;

    reset = 0;
    #100;

    reset = 1;
    #10;

    reset = 0;
    #50;

    $finish;
end

endmodule