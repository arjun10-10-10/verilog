module srff(input s,r,c,rt,output reg q);
  always@ (posedge c )
    begin
      if(rt)
        q<=1'b0;
      else if(s&r)
        q<=1'bx;
      else if(s)
        q<=1'b1;
      else if(r)
        q<=1'b0;
  
      
    end
endmodule
