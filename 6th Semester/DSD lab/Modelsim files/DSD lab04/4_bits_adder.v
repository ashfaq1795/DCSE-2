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

module binary_4_Bits_adder(out,en,sum,cout,A,B);
input [3:0] A,B;
output [3:0]sum;
output cout;
output [6:0]out;
output en;
wire [2:0]w;
FA f0(sum[0],w[0],A[0],B[0],1'b0);
FA f1(sum[1],w[1],A[1],B[1],w[0]);
FA f2(sum[2],w[2],A[2],B[2],w[1]);
FA f3(sum[3],cout,A[3],B[3],w[2]);

assign {en,out} =(sum==4'b0000)? 8'b10111111 :
	    	 (sum==4'b0001)? 8'b10000110 :
	    	 (sum==4'b0010)? 8'b11011011 :
	    	 (sum==4'b0011)? 8'b11001111 :
	    	 (sum==4'b0100)? 8'b11100110 :
	     	 (sum==4'b0101)? 8'b11101101 :
	   	 (sum==4'b0110)? 8'b11111101 :
	    	 (sum==4'b0111)? 8'b10000111 :
	   	 (sum==4'b1000)? 8'b11111111 :
	   	 (sum==4'b1001)? 8'b11101111 : 8'b00000000;												
endmodule
