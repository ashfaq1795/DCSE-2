module vanding_machine_Moore(open,D,N,clk,reset);
input N,D,clk,reset;
output reg open;
parameter zero=0,five=1,ten=2,fifteen=3;
reg [1:0] present_state,next_state;

always @(posedge clk,posedge reset)
        if(reset)
        begin
             present_state=zero;
             open=0;
        end
        else
             present_state=next_state;
always @(*)
       case(present_state)
       zero:
       begin
            open=0;
            if(~D && ~N)
               next_state=zero;
            else if(~D && N)
               next_state=five;
            else if(D && ~N)
               next_state=ten;
            else
               next_state=present_state;
       end
       five:
       begin
            open=0;
            if(~D && ~N)
               next_state=five;
            else if(~D && N)
               next_state=ten;
            else if(D && ~N)
               next_state=fifteen;
            else
               next_state=present_state;
       end
       ten:
       begin
            open=0;
            if(~D && ~N)
               next_state=ten;
            else if(~D && N)
               next_state=fifteen;
            else if(D && ~N)
               next_state=fifteen;
            else
               next_state=present_state;
       end
       fifteen:
       begin
            open=1;
            if(~D && ~N )
               next_state=fifteen;
            else if(D && ~N )
               next_state=fifteen;
            else if(~D && N )
               next_state=fifteen;
            else
                next_state=fifteen;
       end
       default:
       begin
            next_state=zero;
            open=0;
       end
       endcase
endmodule 
       
            
            
        
                
