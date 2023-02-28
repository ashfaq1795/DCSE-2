`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:49 04/08/2022 
// Design Name: 
// Module Name:    decoder2x4 
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
module decoder2x4(in0,in1,out0,out1,out2,out3);
input in0,in1;
output out0,out1,out2,out3;
wire w1,w2;
not n1(w1,in0);
not n2(w2,in1);
and a1(out0,w2,w1);
and a2(out1,in1,w1);
and a3(out2,w2,in0);
and a4(out3,in1,in0);
endmodule
