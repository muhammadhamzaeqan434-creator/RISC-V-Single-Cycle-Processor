`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 10:46:55 PM
// Design Name: 
// Module Name: ALU_tb
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

module ALU_tb;

logic [31:0] rs1;
logic [31:0] rs2;
logic [3:0] Alu_op;
logic [31:0] result;

ALU uut (
    .rs1(rs1),
    .rs2(rs2),
    .Alu_op(Alu_op),
    .result(result)
);

initial
begin

    rs1 = 32'd20;
    rs2 = 32'd10;
    Alu_op = 4'b0000;
    #10;

    rs1 = 32'd20;
    rs2 = 32'd10;
    Alu_op = 4'b0001;
    #10;

    rs1 = 32'd20;
    rs2 = 32'd10;
    Alu_op = 4'b0010;
    #10;

    rs1 = 32'd20;
    rs2 = 32'd10;
    Alu_op = 4'b0110;
    #10;

    $finish;

end

endmodule
