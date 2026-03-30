module sync #(parameter pnt_size = 5)
  ( input sclk, input srst_n, 
   input [pnt_size-1:0] din,
   output reg [pnt_size-1:0] dout ); 
 
  reg [pnt_size-1:0] flop1;
  always @(posedge sclk or negedge srst_n)
    begin
      if (!srst_n) begin flop1 <= 0; dout <= 0; end 
      else         begin flop1 <= din; dout <= flop1; end 
    end 
endmodule
