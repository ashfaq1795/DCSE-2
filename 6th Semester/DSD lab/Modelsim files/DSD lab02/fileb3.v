module RCA(sum,Cout,A,B);
input [3:0] A,B;
output [3:0]sum;
output Cout;
wire [3:1]Cin;
FA f1(sum[0],Cin[1],A[0],B[0],1'b0);    //1'b0=cin[0]
FA f2(sum[1],Cin[2],A[1],B[1],Cin[1]);
FA f3(sum[2],Cin[3],A[2],B[2],Cin[2]);
FA f4(sum[3],Cout,A[3],B[3],Cin[3]);
endmodule
