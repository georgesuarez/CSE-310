// x * ( x + y + z ) * ( x' + y ) * ( x + q ) * ( x + q' + z ).
module Problem5 ( output F, input x, input y, input z, input q );
    assign F = x && ( x || y || z ) && ( !x || y ) && ( x || q ) && ( x || !q || z );
endmodule

// x * ( x' + y )
module Problem5_Solution ( output F, input x, input y );
    assign F = x && ( !x || y );
endmodule

// x * ( x + y + z' ) * ( x' + z ) * ( y + z' ) * ( x + z )
module Problem6 ( output F, input x, input y, input z );
    assign F = x && ( x || y || !z ) && ( !x || z ) && ( y || !z ) && ( x || z );
endmodule

// x * y * z
module Problem6_Solution ( output F, input x, input y, input z );
    assign F = x && y && z;
endmodule