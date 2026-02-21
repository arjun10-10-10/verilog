module tb;
  reg clk=0,rst=1;
  parameter a=4;
  wire [a-1:0]q;
  
johnson dut(clk,rst,q);
  
  always#3 clk=~clk;
  
  initial
    begin
      
      $monitor("q=%B",q);
      
      #3rst=0;
      #200 $finish;
    end
endmodule
