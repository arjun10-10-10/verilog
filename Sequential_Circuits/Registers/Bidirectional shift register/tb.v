
  module bi_tb; 

  reg clk = 0, rst = 1, shift = 0, din = 0;
  wire dout;

  bi_d dut (clk, rst, shift, din, dout);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, bi_tb);

    $monitor("time=%0t clk=%b rst=%b shift=%b din=%b dout=%b",
              $time, clk, rst, shift, din, dout);


    #15 rst = 0;

    
    shift = 1;   // left shift

    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    
 #25 rst = 1;
 #25 rst = 0;

    
    shift = 0;  

    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    #40 $finish;
  end

endmodule
