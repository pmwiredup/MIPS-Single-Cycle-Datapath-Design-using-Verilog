`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 01:39:28
// Design Name: 
// Module Name: shiftleft2bit_tb
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


module TBShiftLeft;
  reg [31:0] in;
  wire [31:0] out;
  Shift_Left sl(out, in);
  initial begin
    $monitor($time, " :Input = %b,\t Output = %b.", in, out);
    #0  in = 32'h2345F000;
    #100  in = 32'h81234011;
    #100  in = 32'h89018310;
    #100  in = 32'hAAAA9999;
    #200  $finish;
  end
endmodule
