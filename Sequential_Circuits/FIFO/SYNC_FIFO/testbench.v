module fifo_tb;

    reg clk = 0;
    reg rst = 0;
    reg wen = 0;
    reg ren = 0;
    reg din = 0;
    wire dout;

    fifo dut (
        .clk(clk),
        .rst(rst),
        .wen(wen),
        .ren(ren),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk; 
    initial begin
        $dumpfile("fifo.vcd");
        $dumpvars(0, fifo_tb);

       #10;
        rst = 1; 

        // write 4 values
        #10 wen = 1; din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 din = 0;
        #10 wen = 0;

        // read 
        #10 ren = 1;
        #40 ren = 0;

        #20 $finish;
    end

endmodule
