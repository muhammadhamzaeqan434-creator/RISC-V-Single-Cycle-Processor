`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 04:01:51 PM
// Design Name: 
// Module Name: IMM_tb
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


module IMM_tb;
logic [31:0] pc;
logic [6:0] op_code;
logic [4:0] rs1;
logic [4:0] rs2;
logic [4:0] rd;
logic [2:0] fun3;
logic [6:0] fun7;
logic [11:0] immd;
instruction_mem uut (
    .pc(pc),
    .op_code(op_code),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .fun3(fun3),
    .fun7(fun7),
    .immd(immd)
);
initial begin
    pc = 0;
    #10;
    pc = 1;
    #10;
    pc = 2;
    #10;
    pc = 3;
    #10;
    $finish;
end

endmodule
