`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:39 04/23/2022 
// Design Name: 
// Module Name:    BCD_TO_Seven_Segment 
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
module BCD_TO_Seven_Segment(in,en,out,enable1,enable2,enable3);
input  [3:0]in;
input en;         //input to enable1
output [6:0]out;
output enable1,enable2,enable3;  
//enable2 and 3 are used for closing led2 and 3 which are not useable in this lab.
assign out=(in==4'b0000)? 7'b1000000 :    //7'b(gfedcba) names of segments.   
			  (in==4'b0001)? 7'b1111001 :    //outputs are active low
			  (in==4'b0010)? 7'b0100100 :    //nested if-else statements 
		     (in==4'b0011)? 7'b0110000 :
		     (in==4'b0100)? 7'b0011001 :
			  (in==4'b0101)? 7'b0010010 :
			  (in==4'b0110)? 7'b0000010 :
		     (in==4'b0111)? 7'b1111000 :
			  (in==4'b1000)? 7'b0000000 :
			  (in==4'b1001)? 7'b0010000 : 7'b1111111;
assign enable1=en;   //on off led from circuit by switch.
assign enable2=1'b1; //off led 2
assign enable3=1'b1;	//off led 3		  
endmodule
