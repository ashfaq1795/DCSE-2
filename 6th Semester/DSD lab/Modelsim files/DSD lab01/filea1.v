module equation(x1,x2,x3,x4,x5,z);
input x1,x2,x3,x4,x5;
output z;
wire y1,y2,nz;
and a1(y1,x1,x2);
and a2(y2,x3,x4,x5);
or o1(nz,y1,y2);
not n1(z,nz);
endmodule 