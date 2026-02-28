
module alu(input [3:0]a,b,input [2:0]sel,output reg [3:0]y,output reg carry);
  reg [4:0]temp;
  always @(*) begin
    carry=0;
    case(sel)
      3'b000:begin
        temp=a+b;
        y=temp[3:0];
        carry=temp[4];
      end
      3'b001:begin
        temp=a-b;
        y=temp[3:0];
        carry=temp[4];
      end
      3'b010:
        y=a*b;
      3'b011:
        y=a/b;
      3'b100:
        y=a^b;
      3'b101:
        y=~(a^b);
      3'b110:
        y=a>>1;
      3'b111:
        y=b<<1;
      default: y=4'b000;
    endcase
  end
endmodule
        
        
  
