module ALU ( output [7:0] Y, input[7:0] A, B, input [2:0] Sel);
	always @ (A, B, Sel)
	begin
	y = 0;
	case (Sel)
		3'b000: y = 8'b0;
		3'b001: y = A & B;
		3'b010: y = A | B;
		3'b011: y = A ^ B;
		3'b100: y = A + B;
		3'b101: y = A - B;
		3'b110: y = ~A;
		3'b111: y = 8'hFF;
	endcase
	end
endmodule