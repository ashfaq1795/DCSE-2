module toplevel;
wire [3:0] w0,w1,w2;
wire clock,clear;
three_BCD td(w2,w1,w0,clear,clock);
three_BCD_test tbt(clear,clock,w2,w1,w0);
endmodule