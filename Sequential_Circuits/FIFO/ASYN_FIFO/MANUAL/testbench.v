

module async_fifo_tb;

    parameter data_width = 8;
    parameter addr_size  = 4;

    reg wclk, wrst_n, wenable;
    reg rclk, rrst_n, renable;
    reg [data_width-1:0] wdata;

    wire [data_width-1:0] rdata;
    wire wfull, rempty;

    async_fifo #(data_width, addr_size) dut (
        .wclk(wclk),
        .wrst_n(wrst_n),
        .wenable(wenable),
        .wdata(wdata),
        .wfull(wfull),

        .rclk(rclk),
        .rrst_n(rrst_n),
        .renable(renable),
        .rdata(rdata),
        .rempty(rempty)
    );

    
    always #5  wclk = ~wclk;  
    always #7  rclk = ~rclk;   

    
    initial begin
        $dumpfile("async_fifo.vcd");
        $dumpvars(0, async_fifo_tb);

       
        wclk = 0; rclk = 0;
        wrst_n = 0; rrst_n = 0;
        wenable = 0; renable = 0;
        wdata = 0;

        
        #20;
        wrst_n = 1;
        rrst_n = 1;

        // wriet
        repeat (10) begin
            @(posedge wclk);
            if (!wfull) begin
                wenable = 1;
                wdata = $random;
            end
        end

        @(posedge wclk);
        wenable = 0;

        //read only
        #20;
        repeat (10) begin
            @(posedge rclk);
            if (!rempty) begin
                renable = 1;
            end
        end

        @(posedge rclk);
        renable = 0;

        //read and write
        #50;
        fork
            begin
                repeat (10) begin
                    @(posedge wclk);
                    if (!wfull) begin
                        wenable = 1;
                        wdata = $random;
                    end
                end
                wenable = 0;
            end

            begin
                repeat (10) begin
                    @(posedge rclk);
                    if (!rempty)
                        renable = 1;
                end
                renable = 0;
            end
        join

        // Finish
        #100;
        $finish;
    end

endmodule
