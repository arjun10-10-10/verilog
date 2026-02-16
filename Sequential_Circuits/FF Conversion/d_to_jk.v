module d_ff(output reg q,input clk,rst,d);
  always@(posedge clk) begin
    if (rst)
      q<=0;
    else
      q<=d;
    
  end
endmodule



module d2jk(output reg jkq,input clk,rst,j,k);
  
  reg w1,w2,w3;
  
  d_ff name1(jkq,clk,rst,w3);
  
  always@(posedge clk)begin
    w1=j&~jkq;
    w2=~k&jkq;
    w3=w1|w2;
    
  end
  
    endmodule
    
