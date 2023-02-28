module three_BCD(hun,ten,one,clear,clock);
input clock,clear;
output [3:0] hun,ten,one;

BCD b1(one,clock,clear);
BCD b2(ten,one[3],clear);
BCD b3(hun,ten[3],clear);
endmodule
