`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 04:28:12 PM
// Design Name: 
// Module Name: Top_module
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



module Top_Module (
    input logic clk,
    input logic reset,

    // Debug outputs
    output logic [31:0] pc,
    output logic [31:0] instruction,
    output logic [6:0] op_code,
    output logic [31:0] alu_result,
    output logic [31:0] read_data1,
    output logic [31:0] read_data2,
    output logic [31:0] write_back_data,

    // Control signals
    output logic Reg_write,
    output logic Mem_read,
    output logic Mem_write
);

    // Internal signals

    logic [4:0] rs1, rs2, rd;
    logic [2:0] fun3;
    logic [6:0] fun7;
    logic [11:0] immd;

    logic [31:0] immediate;
    logic [31:0] alu_input2;
    logic [31:0] memory_data;

    logic [3:0] alu_control_signal;
    logic [1:0] alu_op;

    logic Branch;
    logic Memtoreg;
    logic Alu_src;


    // 1. Program Counter

    Program_counter PC (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );


    // 2. Instruction Memory

    instruction_mem IM (
        .pc(pc),
        .op_code(op_code),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .fun3(fun3),
        .fun7(fun7),
        .immd(immd),
        .instruction_out(instruction)
    );


    // 3. Control Unit

    Control_unit CU (
        .Op_code(op_code),
        .Alu_op(alu_op),
        .Branch(Branch),
        .Mem_read(Mem_read),
        .Memtoreg(Memtoreg),
        .Mem_write(Mem_write),
        .Alu_src(Alu_src),
        .Reg_write(Reg_write)
    );


    // 4. Register File

    Register_file RF (
        .clk(clk),
        .reset(reset),
        .rs_in(rs1),
        .rt_in(rs2),
        .rd_in(rd),
        .write_ena(Reg_write),
        .write_data(write_back_data),
        .rs_out(read_data1),
        .rt_out(read_data2)
    );


    // 5. Immediate Generator

    imm_generator IG (
        .imm_in(immd),
        .op_code(op_code),
        .fun7(fun7),
        .instruction(instruction),
        .imm_out(immediate)
    );


    // 6. ALU Input MUX

    Mux ALU_MUX (
        .rs2(read_data2),
        .imm(immediate),
        .select(Alu_src),
        .out(alu_input2)
    );


    // 7. ALU Control

    Alu_control AC (
        .fun_3(fun3),
        .fun_7(fun7),
        .Alu_op(alu_op),
        .Alu_output(alu_control_signal)
    );


    // 8. ALU

    ALU ALU_Unit (
        .rs1(read_data1),
        .rs2(alu_input2),
        .Alu_op(alu_control_signal),
        .result(alu_result)
    );


    // 9. Data Memory

    Data_memory DM (
        .clk(clk),
        .Mem_write(Mem_write),
        .Mem_read(Mem_read),
        .addr(alu_result),
        .op_code(op_code),
        .write_data(read_data2),
        .fun_3(fun3),
        .read_data(memory_data)
    );


    // 10. Write Back MUX

    Mux WB_MUX (
        .rs2(alu_result),
        .imm(memory_data),
        .select(Memtoreg),
        .out(write_back_data)
    );


endmodule