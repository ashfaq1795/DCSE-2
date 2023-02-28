module PISO_LSHIFT(out,in,load,shift,clk);     //PISO left shift register..
input load,shift,clk;
input [3:0]in;
output reg out;
reg [3:0] load_reg;

always@(posedge clk)
        if(load)
        load_reg=in;                         //load data parallely..
        else if(shift)
        begin
        out=load_reg[3];                    //read data serially 1 bit at a time from left side.
        //out=load_reg[0]                    for PISO right shift register
        load_reg={load_reg[2:0],1'b0};
        // load_reg={1'b0,load_reg[3:1]}       for PISO right shift register
        end
 endmodule
 
 
 //for load=0; shhift=0;     nothing will happen. previous state retain.
 //for load=1; shhift=0;     data will load to register.
 //for load=0; shhift=1;     data will shift and display data (both shift and dispaly will 1 bits )
//for load=1; shhift=1;     nothing will happen. previous state retain.        

//in case n-bits PISO left or right shift register we need 1 clock cycle for data input and n clock cycle for data dispaly.