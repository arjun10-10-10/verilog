module moore_overlap_1001 (
    input x,
    input clk,
    input rst,
    output reg y
);

    reg [2:0] state, nxt_state;

    parameter s0 = 3'b000,
              s1 = 3'b001,
              s2 = 3'b010,
              s3 = 3'b011,
              s4 = 3'b100;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= s0;
        else
            state <= nxt_state;
    end

    always @(*) begin
        nxt_state = s0;

        case (state)

            s0: begin
                if (x)
                    nxt_state = s1;
                else
                    nxt_state = s0;
            end

            s1: begin
                if (x)
                    nxt_state = s1;
                else
                    nxt_state = s2;
            end

            s2: begin
                if (x)
                    nxt_state = s3;
                else
                    nxt_state = s0;
            end

            s3: begin
                if (x)
                    nxt_state = s1;
                else
                    nxt_state = s4;
            end

            s4: begin
                if (x)
                    nxt_state = s1;
                else
                    nxt_state = s0;
            end

        endcase
    end

    always @(*) begin
        case (state)
            s4: y = 1;
            default: y = 0;
        endcase
    end

endmodule
```
