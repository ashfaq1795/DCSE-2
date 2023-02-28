module sum(su,A,B);
input A,B;
output su;
//wire su;   //here we can declare it as a wire or not but in always block we must declare veriable as a wire to which value is assigned. 
//Equation of sum (half adder). (data flow level).
assign su=A^B;
//we can also use su=(A&~B)+(~A&B);
endmodule
