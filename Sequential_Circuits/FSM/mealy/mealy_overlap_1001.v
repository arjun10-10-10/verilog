module mealy_overlap_1001 (
    input x,
    input clk,
    input rst,
    output reg y
);

    reg [1:0] state, nxt_state;

    parameter s0 = 2'b00,
              s1 = 2'b01,
              s2 = 2'b10,
              s3 = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= s0;
        else
            state <= nxt_state;
    end

    always @(*) begin
        y = 0;
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
                if (x) begin
                    nxt_state = s1;
                end
                else begin
                    y = 1;
                    nxt_state = s2;
                end
            end

        endcase
    end

endmodule
