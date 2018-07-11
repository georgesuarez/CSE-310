module GBC ( output a, b, c, d, input w, x, y, z );
	assign a = w;
	assign b = w ^ x;
	assign c = b ^ y;
	assign d = c ^ z; 
endmodule