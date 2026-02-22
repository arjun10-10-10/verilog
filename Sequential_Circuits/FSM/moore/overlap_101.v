module moore_overlap_101(
    input x,
    input clk,
    input rst,
    output reg y
);

reg [1:0] state, next_state;

parameter s0 = 2'b00,
          s1 = 2'b01,
          s2 = 2'b10,
          s3 = 2'b11;

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= s0;
    else
        state <= next_state;
end

always @(*) begin
    case (state)
        s0: next_state = (x) ? s1 : s0;
        s1: next_state = (x) ? s1 : s2;
        s2: next_state = (x) ? s3 : s0;
        s3: next_state = (x) ? s1 : s2;
        default: next_state = s0;
    endcase
end

always @(*) begin
    case (state)
        s3: y = 1;
        default: y = 0;
    endcase
end

endmodule
