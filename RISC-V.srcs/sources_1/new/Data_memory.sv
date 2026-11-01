`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 02:43:56 PM
// Design Name: 
// Module Name: Data_memory
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




module Data_memory #(
    parameter data_width = 32,
    parameter addr_width = 8,
    parameter fun3_len = 3,
    parameter op_len = 7
)(
    input logic clk,
    input logic Mem_write,
    input logic Mem_read,
    input logic [data_width-1:0] addr,
    input logic [op_len-1:0] op_code,
    input logic [data_width-1:0] write_data,
    input logic [fun3_len-1:0] fun_3,
    output logic [data_width-1:0] read_data
);

    logic [data_width-1:0] memory [0:(2**addr_width)-1];

    logic [data_width-1:0] word_data;
    logic [7:0] byte_data;
    logic [15:0] halfword_data;

    initial begin
        $readmemb("Datamemory.mem", memory);
    end

    // Store Instructions
    always_ff @(posedge clk) begin

        if (Mem_write && op_code == 7'b0100011) begin

            case (fun_3)

                // SB
                3'b000: begin
                    case (addr[1:0])
                        2'b00: memory[addr[addr_width+1:2]][7:0] <= write_data[7:0];
                        2'b01: memory[addr[addr_width+1:2]][15:8] <= write_data[7:0];
                        2'b10: memory[addr[addr_width+1:2]][23:16] <= write_data[7:0];
                        2'b11: memory[addr[addr_width+1:2]][31:24] <= write_data[7:0];
                    endcase
                end

                // SH
                3'b001: begin
                    if (addr[1] == 1'b0)
                        memory[addr[addr_width+1:2]][15:0] <= write_data[15:0];
                    else
                        memory[addr[addr_width+1:2]][31:16] <= write_data[15:0];
                end

                // SW
                3'b010: begin
                    memory[addr[addr_width+1:2]] <= write_data;
                end

                default: begin
                end

            endcase
        end
    end

    // Load Instructions
    always_comb begin

        read_data = '0;

        word_data = memory[addr[addr_width+1:2]];

        byte_data = '0;
        halfword_data = '0;

        // Byte selection
        case (addr[1:0])

            2'b00: byte_data = word_data[7:0];
            2'b01: byte_data = word_data[15:8];
            2'b10: byte_data = word_data[23:16];
            2'b11: byte_data = word_data[31:24];

        endcase

        // Halfword selection
        if (addr[1] == 1'b0)
            halfword_data = word_data[15:0];
        else
            halfword_data = word_data[31:16];

        if (Mem_read && op_code == 7'b0000011) begin

            case (fun_3)

                // LB
                3'b000:
                    read_data = {{24{byte_data[7]}}, byte_data};

                // LH
                3'b001:
                    read_data = {{16{halfword_data[15]}}, halfword_data};

                // LW
                3'b010:
                    read_data = word_data;

                // LBU
                3'b100:
                    read_data = {24'b0, byte_data};

                // LHU
                3'b101:
                    read_data = {16'b0, halfword_data};

                default:
                    read_data = '0;

            endcase
        end
    end

endmodule

