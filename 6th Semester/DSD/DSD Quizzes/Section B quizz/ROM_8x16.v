module ROM_8x16 (cs, addrb, datab, read_en);

	input [3:0] addrb;
	output [15:0] datab;
	input cs, read_en;
	
	wire [7:0] datab1, datab2;
	
	ROM1_8x8 rc1 (cs, addrb, datab1, read_en);
	ROM2_8x8 rc2 (cs, addrb, datab2, read_en);
	
	assign datab = (cs && read_en)?{datab2, datab1}:8'bz;
	
endmodule