`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:22:26 PM
// Design Name: 
// Module Name: Alu_control
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



module Alu_control #(
    parameter fun3_len = 3,
    parameter fun7_len = 7,
    parameter Alu_op_len = 2,
    parameter Alu_output_len = 4
)(
    input logic [fun3_len-1:0] fun_3,
    input logic [fun7_len-1:0] fun_7,

    input logic [Alu_op_len-1:0] Alu_op,

    output logic [Alu_output_len-1:0] Alu_output
);

always_comb begin

    // Default operation: ADD
    Alu_output = 4'b0010;

    case (Alu_op)

        // Load, Store and I-type
        2'b00: begin
            Alu_output = 4'b0010;
        end

        // R-type
        2'b10: begin

            case (fun_3)

                // ADD or SUB
                3'b000: begin
                    if (fun_7 == 7'b0100000)
                        Alu_output = 4'b0110;
                    else
                        Alu_output = 4'b0010;
                end

                // AND
                3'b111:
                    Alu_output = 4'b0000;

                // OR
                3'b110:
                    Alu_output = 4'b0001;

                default:
                    Alu_output = 4'b0010;

            endcase
        end

        // Branch comparison: SUB
        2'b01: begin
            Alu_output = 4'b0110;
        end

        default: begin
            Alu_output = 4'b0010;
        end

    endcase

end

endmodule

