`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 01:28:08
// Design Name: 
// Module Name: signextend32bit_tb
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

module TBSignExtender;
  reg [15:0] in;
  wire [31:0] out;
  Sign_Extender se(out, in);
  initial begin
    $monitor($time, " :Input = %b,\t Output = %b.", in, out);
    #0  in = 16'hF000;
    #100  in = 16'h011;
    #100  in = 16'h8310;
    #100  in = 16'h9999;
    #200  $finish;
  end
endmodule
