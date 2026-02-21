module bcd_counter(input clk,rst,output reg [3:0]q=0);

  always@(posedge clk )
    begin
      if(rst )
        q<=0;
      else if (q==9)
        q<=0;
      else
        q<=q + 1;
    end
endmodule
