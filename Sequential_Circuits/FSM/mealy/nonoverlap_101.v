module mealy_nonoverlap_101 (
    input x,
    input clk,
    input rst,
    output reg y
);

    reg [1:0] state, nxt_state;

    parameter s1 = 2'b00,
              s2 = 2'b01,
              s3 = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= s1;
        else
            state <= nxt_state;
    end

    always @(*) begin
        y = 0;
        nxt_state = s1;

        case (state)

            s1: begin
                if (x)
                    nxt_state = s2;
                else
                    nxt_state = s1;
            end

            s2: begin
                if (x)
                    nxt_state = s2;
                else
                    nxt_state = s3;
            end

            s3: begin
                if (x) begin
                    y = 1;
                    nxt_state = s1;
                end
                else
                    nxt_state = s1;
            end

        endcase
    end

endmodule
