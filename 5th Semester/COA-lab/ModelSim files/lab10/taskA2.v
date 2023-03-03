module stim_mux2x1();
reg A,B,sel;
wire F;
mux2x1 tb(A,B,sel,F);
initial 
begin 
 $display("A,B,sel,F");
A=0;B=0; sel=0;
#10 $display("%b,%b,%b,%b",A,B,sel,F);
A=0;B=0; sel=1;
#10 $display("%b,%b,%b,%b",A,B,sel,F);
A=0;B=1; sel=0;
#10 $display("%b,%b,%b,%b",A,B,sel,F);
A=0;B=1; sel=1;
#10 $display("%b,%b,%b,%b",A,B,sel,F);
A=1;B=0; sel=0;
#10 $display("%b,%b,%b,%b",A,B,sel,F);
A=1;B=0; sel=1;
#10 $display("%b,%b,%b,%b",A,B,sel,F);
A=1;B=1; sel=0;
#10 $display("%b,%b,%b,%b",A,B,sel,F);
A=1;B=1; sel=1;
#10 $display("%b,%b,%b,%b",A,B,sel,F);
end 
endmodule

 