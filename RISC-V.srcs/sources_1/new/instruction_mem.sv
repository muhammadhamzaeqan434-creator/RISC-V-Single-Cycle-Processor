`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 04:09:21 PM
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem #(
    parameter inst_size = 32,
    parameter mem_depth = 19,
    parameter op_len = 7,
    parameter pc_len = 32,
    parameter reg_len = 5,
    parameter fun3_len = 3,
    parameter fun7_len = 7,
    parameter immd_len = 12
)(
    input logic [pc_len-1:0] pc,

    output logic [op_len-1:0] op_code,
    output logic [reg_len-1:0] rs1,
    output logic [reg_len-1:0] rs2,
    output logic [reg_len-1:0] rd,

    output logic [fun3_len-1:0] fun3,
    output logic [fun7_len-1:0] fun7,
    output logic [immd_len-1:0] immd,

    output logic [inst_size-1:0] instruction_out
);

    logic [inst_size-1:0] instruction_mem [0:mem_depth-1];

    integer word_index;

    initial begin
        $readmemb("instruction_mem.mem", instruction_mem);
    end

    always_comb begin

        // Default values
        word_index = pc >> 2;
        instruction_out = '0;

        op_code = '0;
        rs1 = '0;
        rs2 = '0;
        rd = '0;
        fun3 = '0;
        fun7 = '0;
        immd = '0;

        // Check memory address
        if ((pc[1:0] == 2'b00) &&
            (word_index < mem_depth)) begin

            instruction_out = instruction_mem[word_index];

        end

        // Extract instruction
        op_code = instruction_out[6:0];

        // R-type
        if (op_code == 7'b0110011) begin

            rs1 = instruction_out[19:15];
            rs2 = instruction_out[24:20];
            rd = instruction_out[11:7];

            fun3 = instruction_out[14:12];
            fun7 = instruction_out[31:25];

        end

        // I-type and Load
        else if (op_code == 7'b0010011 ||
                 op_code == 7'b0000011) begin

            rs1 = instruction_out[19:15];
            rd = instruction_out[11:7];

            fun3 = instruction_out[14:12];
            immd = instruction_out[31:20];

        end

        // S-type
        else if (op_code == 7'b0100011) begin

            rs1 = instruction_out[19:15];
            rs2 = instruction_out[24:20];

            fun3 = instruction_out[14:12];

            immd = {
                instruction_out[31:25],
                instruction_out[11:7]
            };

        end

    end

endmodule
