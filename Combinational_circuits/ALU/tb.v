module alu_tb;
  reg [3:0]a,b;
  reg [2:0]sel;
  wire [3:0]y;
  wire carry;
  alu dut(.*);
  initial begin
    $dumpfile("out_alu.vcd");
    $dumpvars(0,alu_tb);
    $monitor("time=%0t a=%b b=%b carry=%b sel=%b y=%b",$time,a,b,carry,sel,y);
  end
  initial begin 
    a=4'b1100;b=4'b1010;sel=3'b000;#10;
    a=4'b0100;b=4'b1010;sel=3'b001;#10;
    sel=3'b010;#10;
    a=4'b1010;b=4'b0100;sel=3'b011;
    $finish;
  end
endmodule
