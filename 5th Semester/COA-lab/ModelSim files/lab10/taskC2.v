module stim_mux8x1();
reg I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2;
wire F;
mux8x1 td(I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
initial
begin
$display("(I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F");
I0=1;I1=0;I2=0;I3=0;I4=0;I5=0;I6=0;I7=0;s0=0;s1=0;s2=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
I0=0;I1=1;I2=0;I3=0;I4=0;I5=0;I6=0;I7=0;s0=0;s1=0;s2=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
I0=0;I0=0;I2=1;I3=0;I4=0;I5=0;I6=0;I7=0;s0=0;s1=1;s2=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
I0=0;I1=0;I2=0;I3=1;I4=0;I5=0;I6=0;I7=0;s0=0;s1=1;s2=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
I0=0;I1=0;I2=0;I3=0;I4=1;I5=0;I6=0;I7=0;s0=1;s1=0;s2=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
I0=0;I1=0;I2=0;I3=0;I4=0;I5=1;I6=0;I7=0;s0=1;s1=0;s2=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
I0=0;I1=0;I2=0;I3=0;I4=0;I5=0;I6=1;I7=0;s0=1;s1=1;s2=0;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
I0=0;I1=0;I2=0;I3=0;I4=0;I5=0;I6=0;I7=1;s0=1;s1=1;s2=1;
#10 $display("%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b,%b",I0,I1,I2,I3,I4,I5,I6,I7,s0,s1,s2,F);
end
endmodule