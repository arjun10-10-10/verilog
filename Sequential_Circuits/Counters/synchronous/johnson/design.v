
module johnson #(parameter a=4)(input clk,rst,output [a-1:0]q=4'b0000);
  
  always@(posedge clk) begin
    
    if(rst)
      
      
      q<=4'b0000;
    
    else
      
      q<={q[a-2:0],~q[a-1]};
    
    
  end
     
endmodule
