module mux2x1(A,B,C,D,sel1,sel2,sel3,F)
input(A,B,C,D,sel1,sel2,sel3);
output(F);

not n1(nsel1,sel1);
not n2(nsel2,sel2);
not n3(nsel3,sel3);

and a1(F1,A,nsel1);
and a2(F2,B,sel1);
or r1(F3,F1,F2);

and a3(F4,C,nsel2);
and a4(F5,C,sel2);
or r2(F6,F4,F5);

and a5(F7,F3,nsel3);
and a6(F8,F4,sel3);
or r3(F9,F7,F8);

endmodule
