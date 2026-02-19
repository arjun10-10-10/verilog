module counter_tb;

    reg clk=0;
    wire [3:0] q;
    counter dut (
        .clk(clk),
        .q(q)
    );
 always #5 clk = ~clk;
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0,counter_tb);
        $monitor("time=%0t clk=%b q=%b", $time, clk, q);
 
        #100 $finish;
    end

endmodule
