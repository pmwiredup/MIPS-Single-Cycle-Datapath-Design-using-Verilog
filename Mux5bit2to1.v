`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2025 03:24:32
// Design Name: 
// Module Name: Mux5bit2to1
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

module mux2to1(input a, b, sel,
output out);
assign out = sel? b:a;
endmodule

module MUX5Bit_2To1(output[4:0] out,
input select,
input [4:0] q1,q2);

genvar j;

generate 
for(j = 0; j <5; j=j+1)
begin: mux5bit
mux2to1 m1(q1[j], q2[j],select, out[j]);
end
endgenerate
endmodule
