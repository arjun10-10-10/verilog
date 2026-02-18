module jk(input j,k,clk,rst,output reg q );
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=1'b0;
     
      else if (j&k)
        q<=~q;
 else if(j)
        q<=1'b1;
      else if(k)
        q<=1'b0;
      else
        q<=q;
      
       end
endmodule
