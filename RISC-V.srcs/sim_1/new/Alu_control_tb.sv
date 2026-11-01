`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:56:24 PM
// Design Name: 
// Module Name: Alu_control_tb
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


module Alu_control_tb;

logic [2:0] fun_3;
logic [6:0] fun_7;
logic [1:0] Alu_op;
logic [3:0] Alu_output;

Alu_control uut (
    .fun_3(fun_3),
    .fun_7(fun_7),
    .Alu_op(Alu_op),
    .Alu_output(Alu_output)
);

initial
begin

    Alu_op = 2'b10;
    fun_7 = 7'b0000000;
    fun_3 = 3'b000;
    #10;

    Alu_op = 2'b10;
    fun_7 = 7'b0000000;
    fun_3 = 3'b111;
    #10;

    Alu_op = 2'b10;
    fun_7 = 7'b0000000;
    fun_3 = 3'b110;
    #10;

    Alu_op = 2'b10;
    fun_7 = 7'b0100000;
    fun_3 = 3'b000;
    #10;

    Alu_op = 2'b00;
    fun_7 = 7'b0000000;
    fun_3 = 3'b000;
    #10;

    Alu_op = 2'b01;
    fun_7 = 7'b0000000;
    fun_3 = 3'b000;
    #10;

    $finish;

end

endmodule