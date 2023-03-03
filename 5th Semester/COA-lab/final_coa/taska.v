module circuit(a,b,c,f);
input a,b,c;
output f;
wire f1,f2,f3,f4,f5,f6,f7,af2,af5,af7,f8,na,nb,nc,w,x;
not n1(na,a);
not n2(nb,b);
not n3(nc,c);
and a1(f1,na,nb,nc);
and a2(f2,na,nb,c);
and a3(f3,na,b,nc);
and a4(f4,na,b,c);
and a5(f5,a,nb,nc);
and a6(f6,a,nb,c);
and a7(f7,a,b,nc);
and a8(f8,a,b,c);
and a9(af2,f1,f2);
and a10(af5,f4,f5);
and a11(af7,f6,f7);
and a12(w,af2,f3);
or o1(x,w,af5,af7);
or o2(f,x,f8);
endmodule


