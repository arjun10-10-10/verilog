module tb;
    parameter dwidth = 4;
   reg clk=0,rst=0,wenable=1;
  reg [dwidth-1:0] din=0;
  reg [2:0] addr=0;      
  wire [dwidth-1:0]dout ;

  
  sram #(dwidth) dut(.*);
   always#5 clk=~clk;
      
       initial
         begin
           //write
           #30 rst=1;
           addr=3'b010;
           din=4'b111;
           
           //read 
           #35
           wenable=0;
           addr=3'b010;
           #30 $finish;
         end
  
   initial begin
   
    
    $dumpfile("wave.vcd");
    $dumpvars;
  end
  
endmodule
