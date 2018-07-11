module Dff (input ck, input rst, input D, output reg Q);
	always @ (posedge ck, posedge rst)
		if (rst) Q <= 1'b0;
		else Q <= D;
endmodule

module mySeqDesign(input ck, input rst, input I, output [2:0] Q);
	wire [2:0] D;
	assign D[0] = Q[1] & !I || Q[0] & I;
	assign D[1] = !Q[1] & !Q[0] & !I || Q[1] & I;

	Dff		 FF0 (ck, rst, D[0], Q[0]),
				 FF1 (ck, rst, D[1], Q[1]);
endmodule