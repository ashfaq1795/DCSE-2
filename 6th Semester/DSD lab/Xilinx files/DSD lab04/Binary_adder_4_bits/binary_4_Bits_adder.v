`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:55 04/23/2022 
// Design Name: 
// Module Name:    binary_4_Bits_adder 
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


module FA(sum,cout,A,B,cin);
input A,B,cin;
output sum,cout;
wire w1,w2,w3;
xor (w1,A,B);
xor (sum,w1,cin);
and (w2,A,B);
and (w3,w1,cin);
or (cout,w2,w3);
endmodule

module binary_4_Bits_adder(out,enable1,enable2,enable3,sum,cout,A,B,en);
input [3:0] A,B;
input en;
output [3:0]sum;
output cout;
output [6:0]out;
output enable1,enable2,enable3;
wire [2:0]w;
FA f0(sum[0],w[0],A[0],B[0],1'b0);
FA f1(sum[1],w[1],A[1],B[1],w[0]);
FA f2(sum[2],w[2],A[2],B[2],w[1]);
FA f3(sum[3],cout,A[3],B[3],w[2]);

assign out =(sum==4'b0000)? 7'b1000000 :
				(sum==4'b0001)? 7'b1111001 :
				(sum==4'b0010)? 7'b0100100 :
				(sum==4'b0011)? 7'b0110000 :
				(sum==4'b0100)? 7'b0011001 :
				(sum==4'b0101)? 7'b0010010 :
				(sum==4'b0110)? 7'b0000010 :
				(sum==4'b0111)? 7'b1111000 :
				(sum==4'b1000)? 7'b0000000 :
				(sum==4'b1001)? 7'b0010000 : 7'b1111111;
assign enable1=~en;
assign enable2=1'b1;
assign enable3=1'b1;				
												
endmodule

