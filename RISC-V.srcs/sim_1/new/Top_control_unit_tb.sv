`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:47:09 PM
// Design Name: 
// Module Name: Top_control_unit_tb
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


module Top_control_unit_tb;

logic [6:0] Op_code;
logic [1:0] Alu_op;
logic Branch;
logic Mem_read;
logic Memtoreg;
logic Mem_write;
logic Alu_src;
logic Reg_write;

Control_unit uut (
    .Op_code(Op_code),
    .Alu_op(Alu_op),
    .Branch(Branch),
    .Mem_read(Mem_read),
    .Memtoreg(Memtoreg),
    .Mem_write(Mem_write),
    .Alu_src(Alu_src),
    .Reg_write(Reg_write)
);

initial
begin

    Op_code = 7'b0110011;
    #10;

    Op_code = 7'b0010011;
    #10;

    Op_code = 7'b0000011;
    #10;

    Op_code = 7'b0100011;
    #10;

    Op_code = 7'b1100011;
    #10;

    $finish;

end

endmodule
