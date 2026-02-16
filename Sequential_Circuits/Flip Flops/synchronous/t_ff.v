module t_ff(output reg q,input clock,rst,t);
  
  always @(posedge clock )begin
    if (rst) 
    q <= 1'b0;
  else    
    q <= q ^ t;

   end
endmodule
