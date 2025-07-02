`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 02:53:09
// Design Name: 
// Module Name: Concatenate_tb
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

module TBconcat();
  reg [31:0] J, PC;
  wire [31:0] out;
  concatJuPC con(out, J, PC);
  initial begin
    $monitor($time, " PC = %b, JumpAddress = %b, Output = %b.", PC, J, out);
    #0  PC = 32'hFFFFFFF0; J = 32'h88000000;
    #20 PC = 32'h98765432; J = 32'h23456789;
    #100 $finish;
  end
endmodule
