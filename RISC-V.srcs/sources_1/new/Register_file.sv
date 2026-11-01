`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 04:27:58 PM
// Design Name: 
// Module Name: Register_file
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



module Register_file #(
    parameter reg_len = 32,
    parameter reg_sl = 5
)(
    input logic clk,
    input logic reset,

    input logic [reg_sl-1:0] rs_in,
    input logic [reg_sl-1:0] rt_in,
    input logic [reg_sl-1:0] rd_in,

    input logic write_ena,
    input logic [reg_len-1:0] write_data,

    output logic [reg_len-1:0] rs_out,
    output logic [reg_len-1:0] rt_out
);

    logic [reg_len-1:0] register [0:(2**reg_sl)-1];

    integer i;

    initial begin
        $readmemb("reg_mem.mem", register);
    end

    // Read operation
    always_comb begin

        if (rs_in == 0)
            rs_out = '0;
        else
            rs_out = register[rs_in];

        if (rt_in == 0)
            rt_out = '0;
        else
            rt_out = register[rt_in];

    end

    // Write operation
    always_ff @(posedge clk) begin

        if (reset) begin

            for (i = 0; i < (2**reg_sl); i = i + 1)
                register[i] <= '0;

        end

        else if (write_ena && rd_in != 0) begin

            register[rd_in] <= write_data;

        end

    end

endmodule
