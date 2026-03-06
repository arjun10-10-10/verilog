module frq_by_2
  (input clk,rst,
    output reg fout=0);
  always@(posedge clk )begin
    if(rst)
  fout<=0;
    else
      fout<=~fout;
  
  end
  
endmodule
