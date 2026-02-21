

module tff(input t,clk,rst,output reg q=0);
  always@(negedge clk or posedge rst)begin
    if(rst)
      q<=0;
    else if(t)
      q<=~q;
    
  end
endmodule 
    
    
    
module asyn_up_counter#(parameter n=4)(input clk,rst,output [n-1:0]q);
     genvar i;
  generate
   
      for (i=0;i<n;i++)     
       begin:flipflop
        if(i==0)
          tff flop(1'b1,clk,rst,q[0]);     
          
      else
        
        tff flop(1'b1,(q[i-1]),rst,q[i]);        
        end
     
      
      endgenerate
      
      
      endmodule
