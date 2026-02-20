module parity_tb;
  reg [n-1:0]data=0;
  wire even_parity_bit,odd_parity_bit;
  parameter n=4;
  parity_gen dut (data,even_parity_bit,odd_parity_bit); 
  
  
  initial 
    begin
      
      $monitor("time=%0t data =%b even_parity_bit=%b odd_parity_bit=%b", $time,data,even_parity_bit,odd_parity_bit );
 
      data=4'b1010;#3
      data=4'b1000;

        #100 $finish;
      
    end
endmodule
