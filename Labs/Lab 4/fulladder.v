
module FA ( output C, output S, input A, input B, input Cin )
    wire S1, C1, C2;
  
    HA ha1(S1, C1, x, y);
    HA ha2(S, C2, S1, z);
    or G1(C, C2, C1);