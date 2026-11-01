`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 07:01:01 PM
// Design Name: 
// Module Name: imm_generator
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




module imm_generator #(
    parameter imm_len = 12,
    parameter ex_len = 32,
    parameter op_len = 7
)(
    input logic [imm_len-1:0] imm_in,
    input logic [op_len-1:0] op_code,
    input logic [31:0] instruction,

    output logic [ex_len-1:0] imm_out
);

    logic [11:0] store_imm;

    always_comb begin

        imm_out = '0;

        store_imm = {
            instruction[31:25],
            instruction[11:7]
        };

        case (op_code)

            // I-type arithmetic and Load
            7'b0010011,
            7'b0000011: begin

                imm_out = {
                    {(ex_len-imm_len){imm_in[imm_len-1]}},
                    imm_in
                };

            end

            // S-type Store
            7'b0100011: begin

                imm_out = {
                    {(ex_len-imm_len){store_imm[imm_len-1]}},
                    store_imm
                };

            end

            default: begin
                imm_out = '0;
            end

        endcase

    end

endmodule

