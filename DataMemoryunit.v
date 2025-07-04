`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2025 04:32:51
// Design Name: 
// Module Name: DataMemoryunit
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

module Data_Memory(Clock, MemRead, ReadAddress, ReadData, MemWrite, WriteAddress, WriteData);
	input MemRead, MemWrite, Clock;
	input [31:0] ReadAddress, WriteAddress;
	input [31:0] WriteData;
	output reg [31:0] ReadData;
	reg [31:0] memory [0:31]; //32 registers of 32 bits each
	integer raddr, waddr;
	initial begin
	  memory[0] = 32'b00000000000000000000000000000000;  // nop
    memory[1] = 32'b00000000000000000000000001010100;  // Value of 84
    memory[2] = 32'b00000000000000000000000000001011;  // Value of 11
    memory[3] = 32'b00000000000000000000000000000000;  // nop
    memory[4] = 32'b00000000000000000000000000000000;  // nop
    memory[5] = 32'b00000000000000000000000000000000;  // nop
    memory[6] = 32'b00000000000000000000000000000000;  // nop
    memory[7] = 32'b00000000000000000000000000000000;  // nop
    memory[8] = 32'b00000000000000000000000000000000;  // nop
    memory[9] = 32'b00000000000000000000000000000000;  // nop
    memory[10]= 32'b00000000000000000000000000000000;  // nop
    memory[11]= 32'b00000000000000000000000000000000;  // nop
    memory[12]= 32'b00000000000000000000000000000000;  // nop
    memory[13]= 32'b00000000000000000000000000000000;  // nop
    memory[14]= 32'b00000000000000000000000000000000;  // nop
    memory[15]= 32'b00000000000000000000000000000000;  // nop
    memory[16]= 32'b00000000000000000000000000000000;  // nop
    memory[17]= 32'b00000000000000000000000000000000;  // nop
    memory[18]= 32'b00000000000000000000000000000000;  // nop
    memory[19]= 32'b00000000000000000000000000000000;  // nop
    memory[20]= 32'b00000000000000000000000000000000;  // nop
    memory[21]= 32'b00000000000000000000000000000000;  // nop
    memory[22]= 32'b00000000000000000000000000000000;  // nop
    memory[23]= 32'b00000000000000000000000000000000;  // nop
    memory[24]= 32'b00000000000000000000000000000000;  // nop
    memory[25]= 32'b00000000000000000000000000000000;  // nop
    memory[26]= 32'b00000000000000000000000000000000;  // nop
    memory[27]= 32'b00000000000000000000000000000000;  // nop
    memory[28]= 32'b00000000000000000000000000000000;  // nop
    memory[29]= 32'b00000000000000000000000000000000;  // nop
    memory[30]= 32'b00000000000000000000000000000000;  // nop
    memory[31]= 32'b00000000000000000000000000000000;  // nop  
  end
	always @(posedge Clock) begin
		raddr <= ReadAddress;
		waddr <= WriteAddress;
		if(MemRead)
		begin
			ReadData <= memory[raddr/4];
		end
		else if(MemWrite)
		begin
			memory[waddr/4] <= WriteData;
		end
	end
endmodule
