module HA(carr,sum,a,b);
input a,b;
output sum,carr;

sum s1(.B(b),.su(sum),.A(a)); //explicitly association
carry c1(carr,a,b);           //positional association
endmodule

//and by using this half adder we can make full adder.