module tb;
  
  parameter n=4;
  reg [n-1:0]data=0;reg parity_bit=0;
  
  wire error,odderror;
  
  parity_checker dut(data,parity_bit,error,odderror);
  
  
   initial 
    begin
      
      $monitor("time=%0t data =%b parity_bit=%b even=%B odd=%b", $time,data,parity_bit,error,odderror );
 
      data=4'b1010;parity_bit=0;#3
      data=4'b1010;parity_bit=1;#3
     

        #100 $finish;
      
    end
endmodule
