`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 03:00:34
// Design Name: 
// Module Name: MainControlUnit
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

module  MainControlUnit(RegDst, Jump, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1, Op);
  output  RegDst, Jump, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1;
  input [5:0] Op;
  wire  RFormat, LW, SW, BEQ, J;
  assign  RFormat = (~Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(~Op[1])&(~Op[0]);
  assign  LW = (Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(Op[1])&(Op[0]);
  assign  SW = (Op[5])&(~Op[4])&(Op[3])&(~Op[2])&(Op[1])&(Op[0]);
  assign  BEQ = (~Op[5])&(~Op[4])&(~Op[3])&(Op[2])&(~Op[1])&(~Op[0]);
  assign  J = (~Op[5])&(~Op[4])&(~Op[3])&(~Op[2])&(Op[1])&(~Op[0]);
  assign  Jump = J;
  assign  RegDst = RFormat;
  assign  ALUSrc = LW | SW;
  assign  MemToReg = LW;
  assign  RegWrite = RFormat | LW;
  assign  MemRead = LW;
  assign  MemWrite = SW;
  assign  Branch = BEQ;
  assign  ALUOp0 = BEQ;
  assign  ALUOp1 = RFormat;
endmodule
