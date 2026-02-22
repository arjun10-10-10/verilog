

module siso_tb;
  parameter n=4;

  reg clk, rst;
  reg  data_in;
  wire  data_out;
  

  siso dut (
      .clk(clk),
      .rst(rst),
      .data_in(data_in),
      .data_out(data_out)
  );
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("siso.vcd");
    $dumpvars;

    clk = 0;
    rst = 1;
    data_in = 1'b0;

    
    #10 rst=0;data_in = 1'b1;
    #10 data_in = 1'b1;
    #10 data_in = 1'b0;
    #10 data_in = 1'b1;
    
    
    
   #140 $finish;
  end
  
  initial 
    $monitor("Time=%0t |clk=%B Data_in=%b | Data_out=%b", 
              $time,clk, data_in, data_out);
  
endmodule

