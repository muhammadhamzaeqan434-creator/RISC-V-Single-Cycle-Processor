`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 10:42:02 PM
// Design Name: 
// Module Name: ALU
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

 
module ALU #(
    parameter Alu_control_len = 4,
    parameter reg_len = 32
)(
    input logic [reg_len-1:0] rs1,
    input logic [reg_len-1:0] rs2,

    input logic [Alu_control_len-1:0] Alu_op,

    output logic [reg_len-1:0] result
);

always_comb begin

    result = '0;

    case (Alu_op)

        // AND
        4'b0000:
            result = rs1 & rs2;

        // OR
        4'b0001:
            result = rs1 | rs2;

        // SUB
        4'b0110:
            result = rs1 - rs2;

        // ADD
        4'b0010:
            result = rs1 + rs2;

        default:
            result = '0;

    endcase

end

endmodule
