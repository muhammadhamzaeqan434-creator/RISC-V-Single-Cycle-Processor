`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2026 12:36:12 PM
// Design Name: 
// Module Name: Top_Module1_tb
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



`timescale 1ns / 1ps

module Top_Module1_tb;

    // =====================================
    // 1. Testbench Signals
    // =====================================

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


    // =====================================
    // 2. Instantiate Top Module (DUT)
    // =====================================

    Top_Module1 DUT (

        .clk(clk),
        .reset(reset),

        .pc(pc),
        .instruction(instruction),
        .op_code(op_code),

        .alu_result(alu_result),

        .read_data1(read_data1),
        .read_data2(read_data2),

        .write_back_data(write_back_data),

        .Reg_write(Reg_write),
        .Mem_read(Mem_read),
        .Mem_write(Mem_write)

    );


    // =====================================
    // 3. Clock Generation
    // =====================================

    initial begin

        clk = 1'b0;

        forever #5 clk = ~clk;

    end


    // =====================================
    // 4. Reset and Simulation
    // =====================================

    initial begin

        reset = 1'b1;

        // Keep reset active for 20 ns
        #20;

        reset = 1'b0;

        // Run processor for 300 ns
        #300;

        $finish;

    end


    // =====================================
    // 5. Display Processor Values
    // =====================================

    initial begin

        $monitor(
            "TIME=%0t | PC=%h | INSTRUCTION=%h | OPCODE=%b | ALU_RESULT=%h | READ1=%h | READ2=%h | WRITE_BACK=%h | REG_WRITE=%b | MEM_READ=%b | MEM_WRITE=%b",

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

