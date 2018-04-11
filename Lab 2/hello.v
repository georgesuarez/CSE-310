// Verilog Test Fixture Template

  `timescale 1 ns / 1 ps

  module hello_world;
		//inputs
	reg [15:0] a;
	reg [15:0] b;
		//outputs
	wire [15:0] s;
	Sum sumTest ( .a (a), .b (b), .s (s) );
initial begin
	a = 89;
	b = 64;
	$display ( "Hello Again!\n" );
	$monitor ( "The sum of %d and %d is %d", a, b, s);
	#80 $finish;
	
end

  endmodule
