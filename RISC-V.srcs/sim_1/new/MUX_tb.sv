`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 11:18:49 PM
// Design Name: 
// Module Name: MUX_tb
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


module Mux_tb;

logic [31:0] mrt;
logic [31:0] mimm;
logic select;
logic [31:0] out;

Mux uut (
    .mrt(mrt),
    .mimm(mimm),
    .select(select),
    .out(out)
);

initial begin

    mrt = 32'd100;
    mimm = 32'd200;
    select = 1'b0;

    #10;

    select = 1'b1;

    #10;

    mrt = 32'h12345678;
    mimm = 32'hABCDEF00;
    select = 1'b0;

    #10;

    select = 1'b1;

    #10;

    $finish;

end

endmodule