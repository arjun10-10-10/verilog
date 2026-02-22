module pipo_tb;
  
  parameter n=4 ;
  reg clk,rst;
  reg[n-1:0]data_in;
  wire [n-1:0]data_out;
  
  
  pipo dut(clk,rst,data_in,data_out);
  
  always#5 clk=~clk;
  
  initial begin
    $dumpfile("pipi.vcd");
    $dumpvars(0, pipo_tb);

        clk = 0;
        rst = 1;
        data_in = 4'b0;

        
        #10 rst = 0;
        data_in = 4'b0110;
       
       
        #40 $finish;
    end
  
   initial 
     $monitor("%B %B %B",clk,data_in,data_out);
   
  
  
endmodule
