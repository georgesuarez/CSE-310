module bcd_tb;

	reg ck;
	reg rst;

	wire [3:0] Q;

	bcdCounter uut ( .ck(ck), .rst(rst), .Q(Q) );

	initial begin
	
	$display ("time\t Clk  Q[3] Q[2] Q[1] Q[0] ");
	$monitor ("%g\t %b %4b ", $time, ck, Q );

        end

	initial begin
		ck = 1'b1;
		rst = 1'b1;
		#2 rst = 1'b0;
	end

	initial #260 $finish;
	always #10 ck = ~ck;
endmodule
