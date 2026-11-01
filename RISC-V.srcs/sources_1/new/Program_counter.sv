`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:08:12 PM
// Design Name: 
// Module Name: Program_counter
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


module Program_counter #(
    parameter pc_len = 32,
    parameter last_pc = 72
)(
    input logic clk,
    input logic reset,

    output logic [pc_len-1:0] pc
);

always_ff @(posedge clk or posedge reset) begin

    if (reset)
        pc <= '0;

    else if (pc >= last_pc)
        pc <= '0;

    else
        pc <= pc + 4;

end

endmodule
