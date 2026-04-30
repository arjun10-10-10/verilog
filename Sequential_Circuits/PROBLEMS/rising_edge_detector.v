module rising_edge_detector (
    input  clk,
    input  rst,
    input  signal,
    output pulse
);
    reg signal_prev;
    always @(posedge clk or posedge rst) begin
        if (rst)
            signal_prev <= 1'b0;
        else
            signal_prev <= signal;
    end
    assign pulse = signal & ~signal_prev;

endmodule
/* module tb_rising_edge_detector;
    reg clk=0, rst=0, signal=0; 
    wire pulse;

  
  rising_edge_detector uut (.*);

    always #5 clk = ~clk;

    initial begin
      
        #10 signal = 1;
        #20 signal = 0;

        #10 signal = 1;
        #20 signal = 0;

        #10 signal = 1;
        #20 signal = 0;

        #10 $finish;
    end

    initial begin

        $dumpvars();
        
    end

endmodule
