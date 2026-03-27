module rom #(parameter dwidth = 4)
(
  input [2:0] addr,                 
  output reg [dwidth-1:0] dout
);

  always @(*) begin
    case (addr)
      3'b000: dout = 4'b0001;
      3'b001: dout = 4'b0010;
      3'b010: dout = 4'b0011;
      3'b011: dout = 4'b0100;
      3'b100: dout = 4'b0101;
      3'b101: dout = 4'b0110;
      3'b110: dout = 4'b0111;
      3'b111: dout = 4'b1000;
      default: dout = 0;
    endcase
  end

endmodule
