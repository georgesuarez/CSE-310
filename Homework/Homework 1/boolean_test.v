// 'include "boolean_test.v"
module testBoolean();

reg A, B, C;
wire F1, F2;

// Intialize all variables
initial begin
    $display ("time\t   A   B   C   F1  F2");
    $monitor ("%g\t   %b   %b   %b   %b    %b", $time, A, B, C, F1, F2);

    A = 1;
    B = 0;
    C = 1;
    
    #75 $finish;
end

    always begin
        #5 C = ~C;
    end
    always begin
        #10 B = ~B;
    end
    always begin
        #20 A = ~A;
    end

boolean1 test1( .F1(F1), .A(A), .B(B), .C(C) );
boolean2 test2( .F2(F2), .A(A), .B(B), .C(C) );
endmodule
