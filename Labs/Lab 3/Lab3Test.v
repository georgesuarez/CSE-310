module testBoolean();

reg A, B, C, D;
wire F1, F2;

// Intialize all variables
initial begin
    $display ("time\t   A   B   C   D   F1  F2");
    $monitor ("%g\t   %b   %b   %b   %b   %b   %b", 
             $time, A, B, C, D, F1, F2);

    A = 1;
    B = 1;
    C = 1;
    D = 1;

    #75 $finish;
end
    always begin
        #5 D = ~D;
    end
    always begin
        #10 C = ~C;
    end
    always begin
        #20 B = ~B;
    end
    always begin
        #40 A = ~A;
    end

// boolean1 test1 ( .F(F1), .A(A), .B(B), .C(C) );
// boolean2 test2 ( .F(F2), .A(A), .B(B) );
boolean3 test3 ( .F(F1), .A(A), .B(B), .C(C), .D(D) );
boolean4 test4 ( .F(F2), .A(A), .C(C) );
endmodule
