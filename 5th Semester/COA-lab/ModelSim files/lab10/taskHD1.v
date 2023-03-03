module halfadder(X,Y,sum,carry);
input X,Y;
output sum,carry;
xor x(sum,X,Y);
and a(carry,X,Y);
endmodule