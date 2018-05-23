module bcdCounter ( input ck, input rst, output [3:0] Q );
	wire [3:0] D;
	assign D[0] = ~Q[0];
	assign D[1] = ~Q[3] & ( Q[1] ^ Q[0] );
	assign D[2] = Q[2] ^ ( Q[1] & Q[0] );
	assign D[3] = Q[3] & ~Q[0] | Q[2] & Q[1] & Q[0];

	Dff    FF0 ( ck, rst, D[0], Q[0] ),
	       FF1 ( ck, rst, D[1], Q[1] ),
	       FF2 ( ck, rst, D[2], Q[2] ),
	       FF3 ( ck, rst, D[3], Q[3] );
endmodule
