module bi_d #(parameter n=4 )
  (input clk,rst,shift,din,
    output  dout);
  
  
  reg [n-1:0]q;
  integer i;
  always@(posedge clk or posedge rst)begin
    if(rst)
      q<=0;
   //left shift 
    else if (shift)
      begin
      q[0]<=din;
        
        for(i=0;i< n -1;i++)begin
          
          q[i+1]<=q[i];
    end
          
      end
    //rightshift
    
    
    else
      begin
        q[n-1]<=din;
        
        for(i= n-1;i>0;i--)begin
          
          q[i-1]<=q[i]; 
    end
          
      end
            
   
 
  end
  
  assign dout = shift ? q[n-1] : q[0];
  
endmodule 
