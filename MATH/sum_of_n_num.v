module sum_n;

  integer n;
  integer i;
  integer sum;
  initial begin
    n = 5;        
    sum = 0;
    for (i = 1; i <= n; i = i + 1) begin
      sum = sum + i;
    end
  end
endmodule
