// A * ( A + B + C ) + B * ( A' + B' )
module boolean1( output F, input A, input B, input C );
    assign F = A && ( A || B || C ) || B && ( !A || !B );
endmodule

//  A + B
module boolean2( output F, input A, input B );
    assign F = A || B;
endmodule

// A * ( A + B' + D' ) + C * ( C + A * B ) + B' * ( B + C )
module boolean3( output F, input A, input B, input C, input D );
    assign F = A && ( A || !B || !D ) || C && ( C || A && B ) || !B && ( B || C );
endmodule

//  A + C 
module boolean4( output F, input A, input C );
    assign F = A || C;
endmodule
