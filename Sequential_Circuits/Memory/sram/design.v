module sram #(parameter dwidth =4 )
  (input clk,rst,wenable,
   input [dwidth-1:0] din,
   input [2:0] addr,
   output reg [dwidth-1:0] dout=0 );
  
  reg [dwidth-1:0] mem [7:0];
  integer i;
  
  always@(posedge clk or negedge rst)
  begin
    if(!rst)
    begin
    dout<=0;
    for(i=0;i<8;i++)
     mem[i]<=0;
     end
  else if(wenable)
    mem[addr]<=din;
  else
    dout<=mem[addr];
  end
  
endmodule


