// half adder
module HA ( output S, C, input x, y );
  xor ( S, x, y );
  and ( C, x, y );
endmodule

//full adder
module FA ( output S, C, input x, y, z );
  wire S1, C1, C2;
  
  HA ha1(S1, C1, x, y);
  HA ha2(S, C2, S1, z);
  or G1(C, C2, C1);
endmodule

module FourBitAdder ( output[3:0] Sum, output C4,
             input[3:0] A, B, input C0 );
  wire C1, C2, C3;

  FA    fa0 (Sum[0], C1, A[0], B[0], C0),
  	fa1 (Sum[1], C2, A[1], B[1], C1),
  	fa2 (Sum[2], C3, A[2], B[2], C2),
  	fa3 (Sum[3], C4, A[3], B[3], C3);
endmodule

//Test bench for example 4-2
module tb_Example ();
  // declare inputs as registers and outputs as wires
//  reg x, y, z;
  reg [3:0] A, B;
  reg  Cin;
  wire [3:0] D;

  initial begin
    $display ("time\t  A3 A2 A1 A0 B3 B2 B1 B0 Cin |  Cout C3 C2 C1 C0");
    $monitor ("%g\t  %b  %b  %b  %b  %b  %b  %b  %b  %b    |   %b   %b  %b  %b  %b", $time, A[3], A[2], A[1], A[0], B[3], B[2], B[1], B[0], Cin, D[3], D[2], D[1], D[0], C4 );
  end
  initial
        begin
            A = 4'b0000;
            B = 4'b0000;
            Cin = 0;
       //#5110 $finish;
       #2555 $finish;
        end
  always begin
   repeat ( 255 ) #10 B = B + 1'b1;
  end

  always begin
   repeat ( 16 ) #160 A = A + 1'b1;
  end

  always begin
    repeat ( 2 ) #2560 Cin = ~Cin;
  end

FourBitAdder  testing ( D, C4, A, B, Cin  );
endmodule

