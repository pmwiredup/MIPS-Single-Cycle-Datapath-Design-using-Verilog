`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2025 03:34:48
// Design Name: 
// Module Name: mux5bit_2to1_tb
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

module TBMux5Bit_2To1;
  reg [4:0] q1, q2;
  reg select;
  wire [4:0] out;
  MUX5Bit_2To1 mux(out, select, q1, q2);
  initial begin
    $monitor($time, " Q1 = %b, Q2 = %b, Select = %b, Output = %b.", q1, q2, select, out);
    #0  q1 = 5'b10101; q2 = 5'b01010; select = 1'b0;
    #50  select = 1'b1;
    #100 $finish;
  end
endmodule
