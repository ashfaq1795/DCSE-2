module Ripplecarryadder(sum,Cout,A,B);
input [3:0] A,B;
output [3:0]sum;
output Cout;
wire [3:1]Cin;
FA f1(Cin[1],sum[0],A[0],B[0],1'b0);   //1'b0=Cin0   1'b0 mean Cin is a 1 bit number which is 0. 
FA f2(Cin[2],sum[1],A[1],B[1],Cin[1]);
FA f3(Cin[3],sum[2],A[2],B[2],Cin[2]);
FA f4(Cout,sum[3],A[3],B[3],Cin[3]);
endmodule