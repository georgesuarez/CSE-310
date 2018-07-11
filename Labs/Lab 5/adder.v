module HA ( output CH, output SH, input x, input y );
  assign CH = x & y;
  assign SH = x ^ y;
endmodule

module FA ( output CF, output SF, input x, input y, input z );
  wire C1, S1, C2;
  HA ha1 ( C1, S1, x, y );
  HA ha2 ( C2, SF, S1, z );
  or o1  ( CF, C1, C2 );
endmodule
