module stimmux2x1(); //here we will not use underscore in name.
reg A,B,sel;
wire F;
mux2x1 t1(A,B,sel,F);
initial 
begin
#10 A=0;B=1;sel=0;
#10 A=1;B=0;sel=1;
end
initial
begin
$monitor("A=%b,B=%b,F=%b",A,B,F);
end
endmodule
