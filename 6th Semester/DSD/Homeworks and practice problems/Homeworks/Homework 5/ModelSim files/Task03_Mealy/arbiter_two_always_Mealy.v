module vanding_machine_Mealy(grant_0,grant_1,request_0,request_1,clk,reset);
input request_0,request_1,clk,reset; 
output reg grant_0,grant_1;
parameter idle=2'd0,gnt0=2'd1,gnt1=2'd2;
reg [1:0] present_state,next_state;

always @(posedge clk,posedge reset)
        if(reset)
        begin
             present_state=idle;
             grant_0=0;
             grant_1=0;
        end
        else
             present_state=next_state;
always @(*)
       case(present_state)
       idle:
           if(~request_0 && ~request_1)
           begin
                grant_0=0;
                grant_1=0;
                next_state=idle;
           end
           else if(request_0)
           begin
                grant_0=1;
                next_state=gnt0;
           end
           else if(request_1)
           begin
                grant_1=1;
                next_state=gnt1;
           end
           else
           begin
                next_state=present_state;
                grant_0=grant_0;
                grant_1=grant_1;
           end    
       gnt0:
           if(request_0)
           begin
                grant_0=1;
                next_state=gnt0;
           end
           else if(~request_0)
           begin
                grant_0=0;
                next_state=idle;
           end
           else
           begin
                next_state=present_state;
                grant_0=grant_0;
                grant_1=grant_1;
           end
       gnt1:
           if(request_1)
           begin
                grant_1=1;
                next_state=gnt1;
           end
           else if(~request_1)
           begin
                grant_1=0;
                next_state=idle;
           end
           else
           begin
                next_state=present_state;
                grant_0=grant_0;
                grant_1=grant_1;
           end
       default:
       begin
            next_state=idle;
            grant_0=0;
            grant_1=0;
       end
       endcase
endmodule 
