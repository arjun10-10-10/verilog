module tb;
  parameter n=4;
  reg[n-1:0]parallel_in=4'b0;
   reg rsin=0;reg lsin=0;
   reg clk=0;reg rst=1;
  reg[1:0]mode=2'b0;
  wire [n-1:0]parallel_out;
   wire  S_out   ;
  
  universal_shift_reg dut(parallel_in, rsin,lsin, clk,rst,mode,parallel_out, S_out   );
  
  
   always#5 clk=~clk;
  
  
  initial begin
      #20rst=0;
    mode=2'b00;
    #10 mode=2'b11;
    parallel_in=4'b1100;
    
    #20 mode=2'b01;rsin=1;#10rsin=0;#10rsin=1;
     #20 mode=2'b10;lsin=1;#10lsin=0;#10lsin=0;
 #250;   $finish;
  end
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars;
 
  end
  
endmodule
