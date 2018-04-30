// Buiding Full Adder using 3x8 Decoder
module FAdec ( output C, output S, input [2:0] a );
  wire [7:0] F;
  dec3x8 dec ( F, a );
  assign S = F[1] | F[2] | F[4] | F[7]; 
  assign C = F[3] | F[5] | F[6] | F[7]; 
endmodule
