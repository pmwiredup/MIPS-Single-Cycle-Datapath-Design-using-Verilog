`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2025 03:42:09
// Design Name: 
// Module Name: decoder5to32_32bit
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


module decoder5_32(Out, In);
  input [4:0] In;
  output  [31:0] Out;
  assign  Out[0] = (~In[4] & ~In[3] & ~In[2] & ~In[1] & ~In[0]),
          Out[1] = (~In[4] & ~In[3] & ~In[2] & ~In[1] & In[0]),
          Out[2] = (~In[4] & ~In[3] & ~In[2] & In[1] & ~In[0]),
          Out[3] = (~In[4] & ~In[3] & ~In[2] & In[1] & In[0]),
          Out[4] = (~In[4] & ~In[3] & In[2] & ~In[1] & ~In[0]),
          Out[5] = (~In[4] & ~In[3] & In[2] & ~In[1] & In[0]),
          Out[6] = (~In[4] & ~In[3] & In[2] & In[1] & ~In[0]),
          Out[7] = (~In[4] & ~In[3] & In[2] & In[1] & In[0]),
          Out[8] = (~In[4] & In[3] & ~In[2] & ~In[1] & ~In[0]),
          Out[9] = (~In[4] & In[3] & ~In[2] & ~In[1] & In[0]),
          Out[10] = (~In[4] & In[3] & ~In[2] & In[1] & ~In[0]),
          Out[11] = (~In[4] & In[3] & ~In[2] & In[1] & In[0]),
          Out[12] = (~In[4] & In[3] & In[2] & ~In[1] & ~In[0]),
          Out[13] = (~In[4] & In[3] & In[2] & ~In[1] & In[0]),
          Out[14] = (~In[4] & In[3] & In[2] & In[1] & ~In[0]),
          Out[15] = (~In[4] & In[3] & In[2] & In[1] & In[0]),
          Out[16] = (In[4] & ~In[3] & ~In[2] & ~In[1] & ~In[0]),
          Out[17] = (In[4] & ~In[3] & ~In[2] & ~In[1] & In[0]),
          Out[18] = (In[4] & ~In[3] & ~In[2] & In[1] & ~In[0]),
          Out[19] = (In[4] & ~In[3] & ~In[2] & In[1] & In[0]),
          Out[20] = (In[4] & ~In[3] & In[2] & ~In[1] & ~In[0]),
          Out[21] = (In[4] & ~In[3] & In[2] & ~In[1] & In[0]),
          Out[22] = (In[4] & ~In[3] & In[2] & In[1] & ~In[0]),
          Out[23] = (In[4] & ~In[3] & In[2] & In[1] & In[0]),
          Out[24] = (In[4] & In[3] & ~In[2] & ~In[1] & ~In[0]),
          Out[25] = (In[4] & In[3] & ~In[2] & ~In[1] & In[0]),
          Out[26] = (In[4] & In[3] & ~In[2] & In[1] & ~In[0]),
          Out[27] = (In[4] & In[3] & ~In[2] & In[1] & In[0]),
          Out[28] = (In[4] & In[3] & In[2] & ~In[1] & ~In[0]),
          Out[29] = (In[4] & In[3] & In[2] & ~In[1] & In[0]),
          Out[30] = (In[4] & In[3] & In[2] & In[1] & ~In[0]),
          Out[31] = (In[4] & In[3] & In[2] & In[1] & In[0]);
endmodule
