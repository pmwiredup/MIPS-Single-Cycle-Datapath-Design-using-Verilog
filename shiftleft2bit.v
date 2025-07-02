`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 01:38:44
// Design Name: 
// Module Name: shiftleft2bit
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


module Shift_Left(out, in);
	input [31:0] in;
	output [31:0] out;
	assign out = {in[29:0],1'b0,1'b0};
endmodule

