module tb;
  reg clk=0,rst=0;
  wire [3:0]q;
  
  bcd_counter dut (clk,rst,q);
       
     always#3 clk=~clk;
  
  initial
    begin
      
      $monitor("q=%B",q);
      
      #3rst=0;
      #200 $finish;
    end
endmodule
