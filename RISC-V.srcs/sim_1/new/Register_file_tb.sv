`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 06:56:30 PM
// Design Name: 
// Module Name: Register_file_tb
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

module Register_file_tb;

    parameter reg_len = 32;
    parameter reg_sl = 5;

    logic clk;
    logic reset;

    logic [reg_sl-1:0] rs_in;
    logic [reg_sl-1:0] rt_in;
    logic [reg_sl-1:0] rd_in;

    logic write_ena;
    logic [reg_len-1:0] write_data;

    logic [reg_len-1:0] rs_out;
    logic [reg_len-1:0] rt_out;

    Register_file #(
        .reg_len(reg_len),
        .reg_sl(reg_sl)
    ) uut (
        .clk(clk),
        .reset(reset),
        .rs_in(rs_in),
        .rt_in(rt_in),
        .rd_in(rd_in),
        .write_ena(write_ena),
        .write_data(write_data),
        .rs_out(rs_out),
        .rt_out(rt_out)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;
        rs_in = 0;
        rt_in = 0;
        rd_in = 0;
        write_ena = 0;
        write_data = 0;

        #10;

        reset = 0;

        // Read x1 and x2
        rs_in = 5'd1;
        rt_in = 5'd2;

        #10;

        // Write 100 into x5
        rd_in = 5'd5;
        write_data = 32'd100;
        write_ena = 1;

        #10;

        write_ena = 0;

        // Read x5
        rs_in = 5'd5;
        rt_in = 5'd1;

        #10;

        // Write 200 into x10
        rd_in = 5'd10;
        write_data = 32'd200;
        write_ena = 1;

        #10;

        write_ena = 0;

        // Read x10
        rs_in = 5'd10;
        rt_in = 5'd5;

        #10;

        // Try to write into x0
        rd_in = 5'd0;
        write_data = 32'd999;
        write_ena = 1;

        #10;

        write_ena = 0;

        // Read x0
        rs_in = 5'd0;
        rt_in = 5'd10;

        #10;

        $finish;

    end

endmodule
