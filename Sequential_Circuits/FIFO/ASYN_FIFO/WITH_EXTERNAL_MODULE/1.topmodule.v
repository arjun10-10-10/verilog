`include sync.v
`include write_ptr.v
`include read_ptr.v
`include memory.v
`include mod_read.v
`include mod_write.v


module top (
    input wclk,
    input rclk,
    input wrst_n,
    input rrst_n
);

    
    wire wen, ren;
    wire [3:0] din, dout;

    wire wfull, rempty;

    wire [4:0] wptr, rptr;
    wire [4:0] wptr_sync, rptr_sync;

    wire [4:0] wbin, rbin;

    
    mod_a A (
        .clk(wclk),
        .rst_n(wrst_n),
        .full(wfull),
        .wen(wen),
        .data_out(din)
    );

   
    fifo_write #(4) W (
        .wclk(wclk),
        .wrst_n(wrst_n),
        .wenable(wen),
        .rd_2_wrpt(rptr_sync),
        .wptr(wptr),
        .wbin(wbin),
        .wfull(wfull)
    );

    
    fifo_read #(4) R (
        .rclk(rclk),
        .rrst_n(rrst_n),
        .renable(ren),
        .wr_2_rdpt(wptr_sync),
        .rptr(rptr),
        .rbin(rbin),
        .rempty(rempty)
    );

   
    sync #(5) sync_r2w (
        .sclk(wclk),
        .srst_n(wrst_n),
        .din(rptr),
        .dout(rptr_sync)
    );

    
    sync #(5) sync_w2r (
        .sclk(rclk),
        .srst_n(rrst_n),
        .din(wptr),
        .dout(wptr_sync)
    );

    
    fifo_mem #(
        .data_width(4),
        .addr_size(4)
    ) MEM (
        .wclk(wclk),
        .wenable(wen),
        .waddr(wbin[3:0]),
        .wdata(din),

        .rclk(rclk),
        .renable(ren),
        .raddr(rbin[3:0]),
        .rdata(dout)
    );

    
    mod_b B (
        .clk(rclk),
        .rst_n(rrst_n),
        .empty(rempty),
        .data_in(dout),
        .ren(ren),
        .data_out()
    );

endmodule
