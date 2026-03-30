module fifo_read #(parameter addr_size = 4)(
    input rclk, rrst_n, renable,
    input [addr_size:0] wr_2_rdpt,
    output reg [addr_size:0] rptr,
    output reg [addr_size:0] rbin,
    output reg rempty
);

    wire [addr_size:0] rgray_next, rbin_next;

    assign rbin_next  = rbin + (renable & ~rempty);
    assign rgray_next = (rbin_next >> 1) ^ rbin_next;

    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rbin <= 0;
            rptr <= 0;
        end else begin
            rbin <= rbin_next;
            rptr <= rgray_next;
        end
    end

    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n)
            rempty <= 1;
        else
            rempty <= (rgray_next == wr_2_rdpt);
    end

endmodule
