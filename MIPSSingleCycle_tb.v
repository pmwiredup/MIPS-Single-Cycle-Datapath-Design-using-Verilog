`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2025 04:42:59
// Design Name: 
// Module Name: MIPSSingleCycle_tb
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

module TBSCDataPath;
  reg clock, reset;
  reg [31:0]  PC;
  wire  [31:0]  ALUOutput, PCCurrent;
  
  SCDataPath  SCDP(ALUOutput, PCCurrent, PC, reset, clock);
  
  initial begin
  forever begin
  clock = 1'b0;
  #10 clock = 1'b1;
  #10 clock = 1'b0;
  end
  end
  
  always @(posedge clock or negedge clock) begin
  $monitor($time, " :PC = %b, Reset = %b, Clock = %b, NextPC = %b, ALUOutput = %b.", PC, reset, clock, PCCurrent, ALUOutput);
  end
  
  initial begin  
    #0  clock = 1'b0; PC = 32'd20; reset = 1'b0;
    #15 reset = 1'b1;
    #10 PC = 32'd12;
    #40 PC = PCCurrent;
    #40 PC = PCCurrent;
    #50 $finish;
  end

endmodule
