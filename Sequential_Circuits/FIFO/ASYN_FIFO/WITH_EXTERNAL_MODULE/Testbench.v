module tb;
  reg wclk=0;
  reg wrst_n=0;
  reg rclk=0;
  reg rrst_n=0;
  
  
  
  top dut(.*);
   always#8 rclk=~rclk;
   always#10 wclk=~wclk;
  
  initial begin
       #30 rrst_n=1;
       #30 wrst_n=1;
    $dumpfile("wave.vcd");
    $dumpvars;
  #350  $finish;
  end
  
endmodule
