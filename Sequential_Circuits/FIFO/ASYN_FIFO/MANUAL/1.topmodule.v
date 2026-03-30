
`include "fifo_write.v"
`include "fifo_read.v"
`include "sync.v"
`include "fifo_mem.v"

module async_fifo #(
    parameter data_width = 8,
    parameter addr_size = 4
)(
    input wclk, wrst_n, wenable,
    input [data_width-1:0] wdata,
    output wfull,

    input rclk, rrst_n, renable,
    output [data_width-1:0] rdata,
    output rempty
);

    wire [addr_size:0] wptr, rptr;
    wire [addr_size:0] wbin, rbin;
    wire [addr_size:0] rd_2_wrpt, wr_2_rdpt;

    fifo_write #(addr_size) u_write (
        .wclk(wclk),
        .wrst_n(wrst_n),
        .wenable(wenable),
        .rd_2_wrpt(rd_2_wrpt),
        .wptr(wptr),
        .wbin(wbin),
        .wfull(wfull)
    );

    fifo_read #(addr_size) u_read (
        .rclk(rclk),
        .rrst_n(rrst_n),
        .renable(renable),
        .wr_2_rdpt(wr_2_rdpt),
        .rptr(rptr),
        .rbin(rbin),
        .rempty(rempty)
    );

    sync #(addr_size+1) u_sync_r2w (
        .sclk(wclk),
        .srst_n(wrst_n),
        .din(rptr),
        .dout(rd_2_wrpt)
    );

    sync #(addr_size+1) u_sync_w2r (
        .sclk(rclk),
        .srst_n(rrst_n),
        .din(wptr),
        .dout(wr_2_rdpt)
    );

    fifo_mem #(data_width, addr_size) u_mem (
        .wclk(wclk),
        .wenable(wenable & ~wfull),
        .waddr(wbin[addr_size-1:0]),
        .wdata(wdata),

        .rclk(rclk),
        .renable(renable & ~rempty),
        .raddr(rbin[addr_size-1:0]),
        .rdata(rdata)
    );

endmodule
