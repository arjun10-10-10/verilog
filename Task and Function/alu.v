module alu_func
  (input  [7:0] a,b,
   input [2:0] sel,
   output reg [7:0] aluuu  );
  
  function [7:0] alu;
  input [7:0] a,b;
  input [2:0] sel;
  begin
    case(sel)
      0: alu = a + b;
      1: alu = a - b;
      2: alu = a & b;
      3: alu = a | b;
      default: alu = 0;
    endcase
  end
endfunction

 always @(*)
  aluuu = alu(a, b, sel);
endmodule

/*module tb;
  reg  [7:0] a,b;
  reg [2:0] sel;
  wire [7:0] aluuu;
  
  alu_func dut( a,b,sel, aluuu  );
  
  
 initial begin
    a=2;b=4;sel=3;
    $monitor("%d %d %d ",a,b,aluuu);
    
   
  #150  $finish;
  end
  
endmodule   
