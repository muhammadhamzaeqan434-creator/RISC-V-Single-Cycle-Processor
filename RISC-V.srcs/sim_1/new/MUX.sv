`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 11:17:58 PM
// Design Name: 
// Module Name: MUX
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


module Mux #(
    parameter reg_len = 32
)(
    input logic [reg_len-1:0] mrt,
    input logic [reg_len-1:0] mimm,
    input logic select,
    output logic [reg_len-1:0] out
);

    always_comb begin

        case (select)

            1'b0: out = mrt;
            1'b1: out = mimm;

            default: out = '0;

        endcase

    end

endmodule
