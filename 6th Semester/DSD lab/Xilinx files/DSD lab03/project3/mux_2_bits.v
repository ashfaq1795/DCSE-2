`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:58 04/08/2022 
// Design Name: 
// Module Name:    mux_2_bits 
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
module mux_2_bits(in0,in1,sel,out);
input [1:0]in0,in1;
input sel;
output [1:0]out;
assign out=sel? in0:in1;
endmodule
