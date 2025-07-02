`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 01:49:08
// Design Name: 
// Module Name: decoder_tb
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

/*module FADDER_tb();
reg x, y, cin;
wire sum, carry;

FADDER f1(x, y, cin, sum, carry);

initial begin
$monitor($time,"x = %b, y = %b, cin = %b, sum = %b, carry = %b", x, y, cin, sum, carry);
#0 x = 1'b1; y = 1'b0; cin =1'b0;
#10 x= 1'b1; y = 1'b1; cin = 1'b0;
#10 x = 1'b1; y = 1'b1; cin = 1'b1;
#10 x = 1'b0; y = 1'b0; cin = 1'b0;
#10 x = 1'b0; y = 1'b1; cin = 1'b1;
#10 $finish;
end

endmodule*/

module FADDER_tb();
wire carry;
wire [31:0] sum;
reg [31:0] A, B;
reg CarryIn;

FADDER32 f1(carry, sum, A, B, CarryIn);

initial begin
$monitor($time, "A = %d, B = %d, CarryIn = %d, sum = %d, carry = %d", A, B, CarryIn, sum, carry);
#0 A = 32'd35; B = 32'd12; CarryIn = 1'b1;
#20 A = 32'd10; B = 32'd20; CarryIn = 1'b0;
#20 A = 32'd0; B = 32'd0; CarryIn = 1'b1;
#40 $finish;
end
endmodule




