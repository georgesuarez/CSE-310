module adder_tb;
  //inputs
  reg x, y, z;
  // outputs
  wire CF, SF;

  FA uut ( CF, SF, x, y, z );

  always 
    #5 z = ~z;
  always 
    #10 y = ~y;
  always 
    #20 x = ~x;

  initial begin
   x = 0;
   y = 0;
   z = 0;
   $display ("time \t x \.... \n");
   $monitor ("%g   \t %d \t %d \t %d \t %d \t %d", $time, x, y, z, CF, SF );
 
   #76 $finish;
  end

endmodule

  
  
