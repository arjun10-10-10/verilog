module universal_shift_reg #(parameter n=4 )
  (input [n-1:0]parallel_in,
   input rsin,lsin,
   input clk,rst,
   input [1:0]mode,
   output reg [n-1:0]parallel_out,
   output  reg S_out   );
  
  
  reg [n-1:0]q=4'b0;
  
  always@(posedge clk or posedge rst)begin
    
    if(rst)
      q<=0;
    else
            begin
    case(mode)
      
      2'b00:q<=q;
   
      2'b01:q<={rsin,q[n-1:1]};
   
      2'b10:q<={q[n-2:0],lsin};
    
    default: q <=parallel_in;
      
    endcase
  end
  end
  always@(*)begin
  if(mode==2'b11)
    parallel_out=q;
  else
    S_out =(mode==2'b01)?q[0]:q[n-1]; end
  endmodule
