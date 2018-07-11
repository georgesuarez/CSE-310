module mux2x1 ( output reg F, input en, input in1, in0 );
    always @ ( en or in1 or in0 )
    begin
        if ( en == 1'b0 )
            F = in0;
        else
            F = in1;
    end
endmodule

module mux4x1 ( output reg F, input en, input in3, in2, in1, in0 );
  wire a, b, c;
  mux2x1 m1 ( a, en, in1, in0 );
  mux2x1 m2 ( b, en, in3, in2 );
  mux2x1 m3 ( c, en, b,  a );
  always @ ( a or b or c )
    F = c;
endmodule

module mux8x1 ( F, in, en );
    input[7:0] in;
    input[1:0] en;
    output F;
    wire mux1, mux2;
    mux4x1 x1( mux1, en[0], in[0], in[1], in[2], in[3] );
    mux4x1 x2( mux2, en[1], in[4], in[5], in[6], in[7] );
    or ( F, mux1, mux2 );
endmodule