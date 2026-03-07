module frq_div_3(input fin,rst,output fout);
 
 
  reg [1:0]count=0;
  
  always@(posedge fin)
  begin
    if(rst)  
   count<=0;
    else if(count==2'b10) 
      count<=0;
    else
      count<=count+1;
  end
  
  assign fout=~count[1];
  endmodule
