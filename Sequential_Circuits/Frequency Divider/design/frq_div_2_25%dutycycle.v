module frq_by_2
  (input clk,rst,
    output reg qa=0,output fout);
  
  
  always@(posedge clk )begin
  
  qa<=~qa;
  
  end
  assign fout = clk && qa ;
  
endmodule
