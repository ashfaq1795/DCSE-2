module mux8x1(I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
input I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2;
output F;
wire ns0,ns1,ns2,oa1,oa2,oa3,oa4,oa5,oa6,oa7,oa8;  //oa1 = output of and gate 1
not n1(ns0,so);
not n2(ns1,s1);
not n3(ns2,s2);
and a1(oa1,I0,ns0,ns1,ns2);
and a2(oa2,I1,ns0,ns1,s2);
and a3(oa3,I2,ns0,s1,ns2);
and a4(oa4,I3,ns0,s1,s2);
and a5(oa5,I4,s0,ns1,ns2);
and a6(oa6,I5,s0,ns1,s2);
and a7(oa7,I6,s0,s1,ns2);
and a8(oa8,I7,s0,s1,s2);
or o1(F,oa1,oa2,oa3,oa4,oa5,oa6,oa7,oa8);
endmodule