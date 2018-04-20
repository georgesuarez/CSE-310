// f1 = a * b * c' + a * c + c
module boolean1( output F1, input A, input B, input C );

    assign F1 = A && B && !C || A  && C || C;

endmodule

// f2 = ( a * b ) + c
module boolean2( output F2, input A, input B, input C );

    assign F2 =  ( A && B ) || C;

endmodule
