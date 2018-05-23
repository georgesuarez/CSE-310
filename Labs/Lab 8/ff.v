module Dff ( input ck, input rst, input D, output reg Q );
 always @ ( posedge ck, posedge rst )
  if ( rst ) Q <= 1'b0;
       else Q <= D;
endmodule

module JKff ( output reg Q, output wire Qn, input ck, rst, J, K );
 assign Qn = ~Q;
 always @ ( posedge ck, negedge rst )
  if ( rst == 0 ) Q <= 1'b0;
  else
   case ( {J,K} )
     2'b00: Q <= Q;     // no change
     2'b01: Q <= 1'b0;  // reset 
     2'b10: Q <= 1'b1;  // set 
     2'b11: Q <= ~Q;  // toggle
   endcase
endmodule

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


