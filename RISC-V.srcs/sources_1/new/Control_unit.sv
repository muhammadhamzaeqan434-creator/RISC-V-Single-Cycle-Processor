`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:04:26 PM
// Design Name: 
// Module Name: Control_unit
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



module Control_unit #(
    parameter Alu_op_len = 2,
    parameter Op_code_len = 7
)(
    input logic [Op_code_len-1:0] Op_code,

    output logic [Alu_op_len-1:0] Alu_op,
    output logic Branch,
    output logic Mem_read,
    output logic Memtoreg,
    output logic Mem_write,
    output logic Alu_src,
    output logic Reg_write
);

always_comb begin

    // Default values
    Branch = 1'b0;
    Mem_read = 1'b0;
    Memtoreg = 1'b0;
    Mem_write = 1'b0;
    Alu_src = 1'b0;
    Reg_write = 1'b0;
    Alu_op = 2'b00;

    case (Op_code)

        // R-type
        7'b0110011: begin
            Alu_op = 2'b10;
            Reg_write = 1'b1;
        end

        // I-type arithmetic
        7'b0010011: begin
            Alu_op = 2'b00;
            Reg_write = 1'b1;
            Alu_src = 1'b1;
        end

        // Load
        7'b0000011: begin
            Alu_op = 2'b00;
            Reg_write = 1'b1;
            Alu_src = 1'b1;
            Mem_read = 1'b1;
            Memtoreg = 1'b1;
        end

        // Store
        7'b0100011: begin
            Alu_op = 2'b00;
            Alu_src = 1'b1;
            Mem_write = 1'b1;
        end

        // Branch (BEQ-type opcode)
        7'b1100011: begin
            Alu_op = 2'b01;
            Branch = 1'b1;
        end

        default: begin
        end

    endcase
end

endmodule
