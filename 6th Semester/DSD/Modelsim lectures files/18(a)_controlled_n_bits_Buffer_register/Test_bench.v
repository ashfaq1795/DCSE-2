module test_bench;
reg C,L;
reg [7:0]in;
wire [7:0]out;

CBR_8bits cbr(out,in,C,L);

always
#5 C=~C;

initial
begin
    C=0;
    in=8'b10110011;   //initial data At t=0nsec.
    #37 in=8'b11100101;
    #10 in=8'hFF;
end
initial
begin
    L=0;
    #7 L=1;
    #25 L=0;  //if another ipnut come before L become positive again then pervious data will lost.
    #40 L=1;
end
initial 
$monitor($time," In=%b,  Out=%b",in,out);
endmodule

//one always block and three initial blocks execute parallely;

//in above test bench data in=8'b11100101 is waiting for load to become positve after25 L=0.if another data i,e 8'bFF come before load-input become positive
//again then previous data 8'b11100101 will not go out.