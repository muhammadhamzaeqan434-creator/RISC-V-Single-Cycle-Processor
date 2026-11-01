`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 03:55:27 PM
// Design Name: 
// Module Name: Data_memory_tb
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




module Data_memory_tb;

    parameter data_width = 32;
    parameter addr_width = 8;
    parameter fun3_len = 3;
    parameter op_len = 7;

    logic clk;
    logic Mem_write;
    logic Mem_read;
    logic [data_width-1:0] addr;
    logic [op_len-1:0] op_code;
    logic [data_width-1:0] write_data;
    logic [fun3_len-1:0] fun_3;
    logic [data_width-1:0] read_data;

    Data_memory #(
        .data_width(data_width),
        .addr_width(addr_width),
        .fun3_len(fun3_len),
        .op_len(op_len)
    ) dut (
        .clk(clk),
        .Mem_write(Mem_write),
        .Mem_read(Mem_read),
        .addr(addr),
        .op_code(op_code),
        .write_data(write_data),
        .fun_3(fun_3),
        .read_data(read_data)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        Mem_write = 0;
        Mem_read = 0;
        addr = 0;
        op_code = 0;
        write_data = 0;
        fun_3 = 0;

        // Wait for memory initialization
        #10;

        // Test 1: SW - Store Word
        @(negedge clk);
        addr = 32'd16;
        write_data = 32'h80FF7F05;
        op_code = 7'b0100011;
        fun_3 = 3'b010;
        Mem_write = 1;
        @(negedge clk);
        Mem_write = 0;

        // Test 2: LW - Load Word
        Mem_read = 1;
        op_code = 7'b0000011;
        fun_3 = 3'b010;
        #1;
        $display("LW:  addr=%0d read_data=%h", addr, read_data);
        if (read_data !== 32'h80FF7F05)
            $display("ERROR: LW failed");
        else
            $display("PASS: LW");

        // Test 3: LB - Load signed byte (address 16)
        addr = 32'd16;
        fun_3 = 3'b000;
        #1;
        $display("LB:  read_data=%h", read_data);
        if (read_data !== 32'h00000005)
            $display("ERROR: LB failed");
        else
            $display("PASS: LB");

        // Test 4: LBU - Load unsigned byte (address 18)
        addr = 32'd18;
        fun_3 = 3'b100;
        #1;
        $display("LBU: read_data=%h", read_data);
        if (read_data !== 32'h000000FF)
            $display("ERROR: LBU failed");
        else
            $display("PASS: LBU");

        // Test 5: LH - Load signed halfword (address 18)
        addr = 32'd18;
        fun_3 = 3'b001;
        #1;
        $display("LH:  read_data=%h", read_data);
        if (read_data !== 32'hFFFF80FF)
            $display("ERROR: LH failed");
        else
            $display("PASS: LH");

        // Test 6: LHU - Load unsigned halfword (address 18)
        fun_3 = 3'b101;
        #1;
        $display("LHU: read_data=%h", read_data);
        if (read_data !== 32'h000080FF)
            $display("ERROR: LHU failed");
        else
            $display("PASS: LHU");

        // Test 7: SB - Store Byte
        @(negedge clk);
        Mem_read = 0;
        Mem_write = 1;
        op_code = 7'b0100011;
        fun_3 = 3'b000;
        addr = 32'd17;
        write_data = 32'h000000AA;
        @(negedge clk);
        Mem_write = 0;

        // Read updated word
        Mem_read = 1;
        op_code = 7'b0000011;
        fun_3 = 3'b010;
        addr = 32'd16;
        #1;
        $display("LW after SB: read_data=%h", read_data);
        if (read_data !== 32'h80FFAA05)
            $display("ERROR: SB failed");
        else
            $display("PASS: SB");

        // Test 8: SH - Store Halfword
        @(negedge clk);
        Mem_read = 0;
        Mem_write = 1;
        op_code = 7'b0100011;
        fun_3 = 3'b001;
        addr = 32'd18;
        write_data = 32'h00001234;
        @(negedge clk);
        Mem_write = 0;

        // Read updated word
        Mem_read = 1;
        op_code = 7'b0000011;
        fun_3 = 3'b010;
        addr = 32'd16;
        #1;
        $display("LW after SH: read_data=%h", read_data);
        if (read_data !== 32'h1234AA05)
            $display("ERROR: SH failed");
        else
            $display("PASS: SH");

        #10;
        $display("Data Memory testing completed.");
        $finish;
    end

endmodule

