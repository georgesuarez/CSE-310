module FAdec_tb;
  //inputs
  reg [2:0] x;
  // outputs
  wire CF, SF;

  FAdec uut ( CF, SF, x);

  always 
    #5 x[0] = ~x[0];
  always 
    #10 x[1] = ~x[1];
  always 
    #20 x[2] = ~x[2];

  initial begin
   x = 3'b000;
   $display ("time \t x \.... \n");
   $monitor ("%g   \t %d \t %d \t %d \t %d \t %d", $time, x[2], x[1], x[0], CF, SF );
 
   #36 $finish;
  end

endmodule

  
  
