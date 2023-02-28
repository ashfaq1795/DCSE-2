module FA(Cout,sum,A,B,Cin);
input A,B,Cin;
output sum,Cout;
wire w1,w2,w3; 
xor x1(w1,A,B);
xor x2(sum,w1,Cin);
and a1(w2,A,B);
and a2(w3,Cin,w1);
or o1(Cout,w2,w3);
endmodule
