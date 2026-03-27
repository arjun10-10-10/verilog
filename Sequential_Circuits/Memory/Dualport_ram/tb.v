module tb;
  parameter dwidth = 4;
  reg clk = 0;
  reg rst = 0;
  reg wenable = 0;
  reg read = 0;
  reg [dwidth-1:0] din = 0;
  reg [2:0] raddr = 0;
  reg [2:0] waddr = 0;
  wire [dwidth-1:0] dout;

  dualportram #(dwidth) dut (.*);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb);

    rst = 0;
    #10 rst = 1;

    #10 wenable = 1; read = 0;
        waddr = 3'b010;
        din   = 4'b0111;

    #10 waddr = 3'b011;
        din   = 4'b1010;

  
    #10 wenable = 0; read = 1;
        raddr = 3'b010;   // expect 0111

    #10 raddr = 3'b011;   // expect 1010

    #10 wenable = 1; read = 1;
        waddr = 3'b100;
        raddr = 3'b010;
        din   = 4'b1111;

    #10 waddr = 3'b101;
        raddr = 3'b101;
        din   = 4'b0011;

   

    #30 $finish;
  end

endmodule
