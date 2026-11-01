`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 11:20:39 PM
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
    input logic [reg_len-1:0] rs2,
    input logic [reg_len-1:0] imm,
    input logic select,

    output logic [reg_len-1:0] out
);

always_comb begin

    if (select == 1'b1)
        out = imm;
    else
        out = rs2;

end

endmodule
