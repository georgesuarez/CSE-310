// name: test
// desc: tests four bit ripple carry adder/subtracter
// date: 
// by  : 
module test();
  reg [3:0] X, Y;
  reg M;
  wire [3:0] S;
  wire C;
  
  // create instance of adder
  four_bit_adder_subtracter add_sub(s,c4,a,b,m);
  
  // set up the monitoring
  initial
  begin
    $display("  X     Y     M   C   S \t\t\t    Time");
    $monitor("%b   %b   %b   %b   %b         %d", X,Y,M,C,S,$time);
    end
  
  // run through a series of numbers
  initial
  begin
        a=4'b0000; b=4'b0000; m=1'b1;
    #10 a=4'b0100; b=4'b0000; m=1'b1;
    #10 a=4'b0100; b=4'b0011; m=1'b1;
    #10 a=4'b0100; b=4'b0011; m=1'b1;
    #10 a=4'b1100; b=4'b0011; m=1'b1;
    #10 a=4'b1100; b=4'b0011; m=1'b1;
    #10 a=4'b0100; b=4'b0000; m=1'b0;
    #10 a=4'b0100; b=4'b0011; m=1'b0;
    #10 a=4'b0100; b=4'b0011; m=1'b0;
    #10 a=4'b1100; b=4'b0011; m=1'b0;
    #10 a=4'b1100; b=4'b0011; m=1'b0;
    #10 $finish;
  end
endmodule