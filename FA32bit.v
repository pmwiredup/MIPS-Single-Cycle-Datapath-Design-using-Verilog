`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 00:40:28
// Design Name: 
// Module Name: FA32bit
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


/*module DECODER(input x, y, z, 
output reg  [0:7]out);

always @(*) begin
case({x,y,z})
3'b000: out = {7'b0000000,1'b1};
3'b001: out = {6'b000000,1'b1,1'b0};
3'b010: out = {5'b00000,1'b1,2'b00};
3'b011: out = {4'b0000,1'b1,3'b000};
3'b100: out = {3'b000,1'b1,4'b0000};
3'b101: out = {2'b00,1'b1,5'b00000};
3'b110: out = {1'b0,1'b1,6'b000000};
3'b111: out = {1'b1, 7'b0000000};
endcase
end
endmodule
*/

module  FADDER(output carry, sum,
input x, y, cin);
assign sum = x^y^cin;
assign carry = x&y | cin&(x^y);  
endmodule

module FADDER8(output carry,
output  [7:0]sum,
input [7:0] A, B,
input CarryIn);

  wire  c1, c2, c3, c4, c5, c6, c7;
  FADDER  mod1(c1, sum[0], A[0], B[0], CarryIn);
  FADDER  mod2(c2, sum[1], A[1], B[1], c1);
  FADDER  mod3(c3, sum[2], A[2], B[2], c2);
  FADDER  mod4(c4, sum[3], A[3], B[3], c3);
  FADDER  mod5(c5, sum[4], A[4], B[4], c4);
  FADDER  mod6(c6, sum[5], A[5], B[5], c5);
  FADDER  mod7(c7, sum[6], A[6], B[6], c6);
  FADDER  mod8(carry, sum[7], A[7], B[7], c7);
endmodule

module FADDER32(output carry,
output  [31:0]sum,
input [31:0] A, B,
input CarryIn);

  wire  c1, c2, c3; 
  FADDER8  mod1(c1, sum[7:0], A[7:0], B[7:0], CarryIn);
  FADDER8  mod2(c2, sum[15:8], A[15:8], B[15:8], c1);
  FADDER8  mod3(c3, sum[23:16], A[23:16], B[23:16], c2);
  FADDER8  mod4(carry, sum[31:24], A[31:24], B[31:24], c3);
endmodule
