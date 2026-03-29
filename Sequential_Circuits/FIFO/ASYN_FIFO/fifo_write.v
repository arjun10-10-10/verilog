module fifo_write #(parameter addr_size = 4)
(
    input wclk, wrst_n, wenable,
    input [addr_size:0] rd_2_wrpt,
    output reg [addr_size:0] wptr,
    output reg [addr_size:0] wbin,
    output reg wfull
);

    wire [addr_size:0] wgray_next, wbin_next;

    assign wbin_next  = wbin + (wenable & ~wfull);
    assign wgray_next = (wbin_next >> 1) ^ wbin_next;

    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            wbin <= 0;
            wptr <= 0;
        end else begin
            wbin <= wbin_next;
            wptr <= wgray_next;
        end
    end

    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n)
            wfull <= 0;
        else
            wfull <= (wgray_next ==
                     {~rd_2_wrpt[addr_size:addr_size-1], rd_2_wrpt[addr_size-2:0]});
    end

endmodule
