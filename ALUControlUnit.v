`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.02.2025 04:07:36
// Design Name: 
// Module Name: ALUControlUnit
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

module  ALUControlUnit(Op, Func, ALUOp);
  input [5:0] Func;
  input [1:0] ALUOp;
  output  [2:0] Op;
  assign  Op[0] = ALUOp[1] & (Func[3] | Func[0]);
  assign  Op[1] = (~ALUOp[1]) | (~Func[2]);
  assign  Op[2] = ALUOp[0] | (ALUOp[1] & Func[1]);
endmodule
