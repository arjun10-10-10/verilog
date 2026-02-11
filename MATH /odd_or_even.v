module oddreven #(parameter N=4)(input [N-1:0]a,output even,odd );
  assign odd = (a%2==0)?0 :1;
  assign even = (a%2==0)?1:0;
endmodule

/*module tb;
  
  reg [N-1:0]a;
  wire even,odd;
  parameter N=16;
  
  oddreven dut (a,even,odd);
  initial 
    begin
      $monitor(" odd=%B  even=%b ",odd,even);
      
      a=7;#3
      a=56;
      #5 $finish; 
    end
endmodule*/
