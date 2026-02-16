module mealy_overlap_101(input x,clk,rst, output reg y);
  
  reg [1:0] state ,nxt_state;
  
  parameter s1=2'b00,
  s2 =2'b01,
  s3=2'b10;
  
  always@(posedge clk or posedge rst)begin
    if(rst==0)
      state<=s1;
    else
     state<= nxt_state;
  end
  
  always@(state or x)begin
    case (state)
     
       s1 : begin
          y=0;
          nxt_state=(x==1)?s2:s1;
        end
        
        s2: begin
          y=0;
          nxt_state=(x==0)?s3:s2;
        end
        
       s3: begin
          y=(x==1)?1:0;
          nxt_state=(x==1)?s2:s1;
        end
            default:begin
              y=0;
              nxt_state<=s1;end
            endcase
        end
            endmodule
