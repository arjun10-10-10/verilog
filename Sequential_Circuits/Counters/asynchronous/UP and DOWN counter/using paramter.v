module tff(input t,clk,rst,output reg q=0);
  always@(negedge clk or posedge rst)begin
    if(rst)
      q<=0;
    else if(t)
      q<=~q;
    
  end
endmodule 
module tff_down(input t,clk,rst,output reg q=0);
  always@(posedge clk or posedge rst)begin
    if(rst)
      q<=0;
    else if(t)
      q<=~q;
    
  end
endmodule 
    
    
    
module asyn_up_counter#(parameter mode=1, n=4)(input clk,rst,output [n-1:0]q);
    
  
  
  
  genvar i;
  generate
    
    if(mode==0)begin:loop1
   
      
      for (i=0;i<n;i++)     
       begin:flipflop
        if(i==0)
          tff flop(1'b1,clk,rst,q[0]);     
          
      else
        
        tff flop(1'b1,(q[i-1]),rst,q[i]);        
        end
    end
    
    
     else
       begin:loop2

         for (i=0;i<n;i++)     
       begin:flipflop
        if(i==0)
          tff_down flop(1'b1,clk,rst,q[0]);     
          
      else
        
        tff_down flop(1'b1,(q[i-1]),rst,q[i]);        
        end
         
         
       end
     
      
      endgenerate
      
      
      endmodule
