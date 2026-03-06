module frq_div_by_4(input clk,rst,output  fout);
  
  reg [1:0]count=0;
  
  always@(posedge clk)begin
    
    if(rst)
    count<=0;
    else 
      count<=count+1;
    end
  
  assign fout =count[1];
endmodule
