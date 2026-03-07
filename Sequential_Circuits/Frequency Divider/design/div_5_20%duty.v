module frq_div_5(input fin,rst,output fout);
  
 
  reg [2:0]count=0;
  
  always@(posedge fin)
  begin
    if(rst)  
   count<=0;
    else if(count==3'b100) 
      count<=0;
    else
      count<=count+1;
  end
  
  assign fout=count[2];
  endmodule
    
