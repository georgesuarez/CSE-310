`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:54 04/09/2018 
// Design Name: 
// Module Name:    Sum 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Sum(
    input [15:0] a,
    input [15:0] b,
    output [15:0] s
    );
  assign s = a + b;
  initial begin
  #20 $finish;
  end

endmodule
