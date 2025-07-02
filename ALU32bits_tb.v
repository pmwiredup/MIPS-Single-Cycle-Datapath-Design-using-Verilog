`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 04:19:11
// Design Name: 
// Module Name: ALU32bits_tb
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

module  ALUTestBench;
  reg [2:0] Op;
  reg [31:0] A, B;
  wire  [31:0] Result;
  wire  CarryOut, Zero;
  ALU32Bit  ALU(Zero, CarryOut, Result, A, B, Op);
  initial begin
    $monitor($time, " :A = %b,\n\t B = %b,\n\t Operation = %b,\n\t Result = %b,\n\t Carry Out = %b,\n\t Zero = %b.", A, B, Op, Result, CarryOut, Zero);
    #0  A = 32'ha5a5a5a5; B = 32'h5a5a5a5a; Op = 3'b000; //must perform AND resulting in zero
    #100  Op = 3'b001;        //OR
    #100  Op = 3'b010;        //ADD
    #100  Op = 3'b110;        //SUB
    #100  A = 32'ha5a5a5a5; B = 32'ha5a5a5a5; Op = 3'b110;    //Check for zero
    #100  B = 32'ha5a5a5a5; A = 32'h5a5a5a5a; Op = 3'b111;    //SLT
    #200  $finish;
  end
endmodule
