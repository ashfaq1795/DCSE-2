module FA(sum,carry,A,B,Cin);
input A,B,Cin;
output sum,carry;
assign {carry,sum}=A+B+Cin;
endmodule
