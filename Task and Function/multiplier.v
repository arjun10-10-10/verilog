module mul(
  input [2:0] a,
  input [2:0] b,
  output reg[4:0] ouutput);
  
  
  task multiplier;
  
    input [2:0] a, b;
    output [4:0]  outpt;
      begin 
        outpt = a*b;
    
    end
    endtask
  
  always@(*)begin
      multiplier(a,b,ouutput); 
  end
  
endmodule 
/*module tb;
  reg[2:0] x;
  reg[2:0] b;
 wire[4:0] ouutput;
  
  test dut(x,b,ouutput);
  initial
    begin
     
      x=3;b=4;  
      #11
     $display("%d %d %d ",x,b,ouutput); 
      
      
    end    
endmodule*/
