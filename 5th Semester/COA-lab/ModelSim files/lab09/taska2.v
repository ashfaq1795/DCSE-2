module stimdec2x4(); //here empty brackets mean it's stimulation or test bench fileof any other file(decoder2x4).
reg A,B;
wire y1,y2,y3,y4;
decoder2x4 tb(A,B,y1,y2,y3,y4); //tb is like object of decoder2x4
initial 
begin
$display("A,B,y1,y2,y3,y4");
A=0; B=0;
#10 $display("%b,%b,%b,%b,%b,%b",A,B,y1,y2,y3,y4);
A=0; B=1;
#10 $display("%b,%b,%b,%b,%b,%b",A,B,y1,y2,y3,y4);
A=1; B=0;
#10 $display("%b,%b,%b,%b,%b,%b",A,B,y1,y2,y3,y4);
A=1; B=1;
#10 $display("%b,%b,%b,%b,%b,%b",A,B,y1,y2,y3,y4);
end  //begin ended
endmodule