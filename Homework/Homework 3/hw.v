module tb();

  reg [3:0] a;
  reg [3:0] b;
  reg [3:0] c;

  initial begin
    a = 1;
    b = 2;
    c = 0;
    a <= b;
    c <= a + 1;
  

    $display("a = ", a," b = ", b, " c = ", c);

  end
endmodule