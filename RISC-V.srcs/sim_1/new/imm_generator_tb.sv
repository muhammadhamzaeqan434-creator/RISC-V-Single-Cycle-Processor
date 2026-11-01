`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 07:24:23 PM
// Design Name: 
// Module Name: imm_generator_tb
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


module imm_generator_tb;

    parameter imm_len = 12;
    parameter ex_len = 32;

    logic [imm_len-1:0] imm_in;
    logic [ex_len-1:0] imm_out;

    imm_generator #(
        .imm_len(imm_len),
        .ex_len(ex_len)
    ) uut (
        .imm_in(imm_in),
        .imm_out(imm_out)
    );

    initial begin

        imm_in = 12'h005;
        #10;

        imm_in = 12'h064;
        #10;

        imm_in = 12'hFFF;
        #10;

        imm_in = 12'hFFB;
        #10;

        imm_in = 12'hFF6;
        #10;

        $finish;

    end

endmodule
