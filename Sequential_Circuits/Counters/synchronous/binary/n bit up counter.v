module counter #(parameter n=8)(input clk,rst,en,output reg [n-1:0]q=0);

  always@(posedge clk )
    begin
      if(rst)
        q<=0;
      else if(en)
        q<=q + 1;
      else
        q<=q;
    end
endmodule
