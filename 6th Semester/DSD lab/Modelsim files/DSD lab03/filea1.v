module buffer(out,in);
parameter N=7;
input [N:0]in;
output [N:0]out;
buf b1(out[0],in[0]);
buf b2(out[1],in[1]);
buf b3(out[2],in[2]);
buf b4(out[3],in[3]);
buf b5(out[4],in[4]);
buf b6(out[5],in[5]);
buf b7(out[6],in[6]);
buf b8(out[7],in[7]);
//Data flow level
//assign out=in;
endmodule  
