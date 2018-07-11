module four_bit_alu( output[3:0] Sum, output Cout, input[3:0] A, B, input M, Cen );
    wire C0, C1, C2;
    wire[3:0] Xor;    // XOR outputs
    wire[3:0] And;    // AND outputs

    xor         X0( Xor[0], M, B[0] ),
                X1( Xor[1], M, B[1] ),
                X2( Xor[2], M, B[2] ),
                X3( Xor[3], M, B[3] );

    and         N0( And[0], Cen, M ),
                N1( And[1], Cen, C0 ),
                N2( And[2], Cen, C1 ),
                N3( And[3], Cen, C2 );

    FA          FA0( C0, Sum[0], A[0], Xor[0], And[0] ),
                FA1( C1, Sum[1], A[1], Xor[1], And[1] ),
                FA2( C2, Sum[2], A[2], Xor[2], And[2] ),
                FA3( Cout, Sum[3], A[3], Xor[3], And[2] );
endmodule