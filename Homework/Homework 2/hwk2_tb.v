module testBench();

reg x, y, z, q;
wire F1, F2;

// Intialize all variables
initial begin
    $display ("time\t   x   y   z   q   F1  F2");
    $monitor ("%g\t   %b   %b   %b   %b   %b   %b", 
             $time, x, y, z, q, F1, F2);

    x = 0;
    y = 0;
    z = 1;
    q = 0;

    #75 $finish;
end
    always begin
        #5 q = ~q;
    end
    always begin
        #10 z = ~z;
    end
    always begin
        #20 y = ~y;
    end
    always begin
        #40 x = ~x;
    end

// Problem5 test1 ( .F(F1), .x(x), .y(y), .z(z), .q(q) );
// Problem5_Solution test1Sol ( .F(F2), .x(x), .y(y) );

Problem6 test2 ( .F(F1), .x(x), .y(y), .z(z) );
Problem6_Solution test2Sol ( .F(F2), .x(x), .y(y), .z(z) );


endmodule
