module decoder4x16(out,enable,A,B,C,D);
input A,B,C,D,enable;
output [15:0]out;
reg [15:0]out;
always @(A or B or C or D or enable)
	if(~enable)
	out=16'b0;
	else
	case ({A,B,C,D})
	0: out=16'b0000000000000000;
	1: out=16'b0000000000000001;
	2: out=16'b0000000000000010;
	3: out=16'b0000000000000011;
	4: out=16'b0000000000000100;
	5: out=16'b0000000000000101;
	6: out=16'b0000000000000110;
	7: out=16'b0000000000000111;
	8: out=16'b0000000000001000;
	9: out=16'b0000000000001001;
       10: out=16'b0000000000001010;
       11: out=16'b0000000000001011;
       12: out=16'b0000000000001100;
       13: out=16'b0000000000001101;
       14: out=16'b0000000000001110;
       15: out=16'b0000000000001111;
	endcase
endmodule





