`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2026 09:00:42 PM
// Design Name: 
// Module Name: Top_module_tb
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





module Top_module_tb;

    logic clk;
    logic reset;

    logic [31:0] pc;
    logic [31:0] instruction;
    logic [6:0] op_code;

    logic [31:0] alu_result;
    logic [31:0] read_data1;
    logic [31:0] read_data2;
    logic [31:0] write_back_data;

    logic Reg_write;
    logic Mem_read;
    logic Mem_write;


    // DUT

    Top_module DUT (
        .clk(clk),
        .reset(reset),

        .pc(pc),
        .instruction(instruction),
        .op_code(op_code),

        .alu_result(alu_result),
        .rs_out(read_data1),
        .rt_out(read_data2),
        .write_back_data(write_back_data),

        .Reg_write(Reg_write),
        .Mem_read(Mem_read),
        .Mem_write(Mem_write)
    );


    // Clock Generation

    initial begin
        clk = 0;

        forever #5 clk = ~clk;
    end


    // Reset and Simulation

    initial begin

        reset = 1;

        #20;

        reset = 0;

        #300;

        $finish;

    end


    // Monitor

    initial begin

        $monitor(
            "Time=%0t | PC=%h | Instruction=%h | Opcode=%b | ALU=%h | Read1=%h | Read2=%h | WB=%h | RegWrite=%b | MemRead=%b | MemWrite=%b",
            $time,
            pc,
            instruction,
            op_code,
            alu_result,
            read_data1,
            read_data2,
            write_back_data,
            Reg_write,
            Mem_read,
            Mem_write
        );

    end

endmodule