`timescale 1ns / 1ps

module test();

    reg A, B, C, D;
    output a, b, c, d, e, f, g;

    initial
        begin

            $display("Time\t A    B  C  D |  a b c d e f g");
            $monitor("%g\t %b    %b  %b  %b |  %b %b %b %b %b %b %b", 
            $time, A, B, C, D, a, b, c, d, e, f, g);
    end

    initial
        begin

            A = 1'b0;
            B = 1'b0;
            C = 1'b0;
            D = 1'b0;
        
            #150 $finish;
    end

    
        always #10 D = ~D;
        always #20 C = ~C;
        always #40 B = ~B;
        always #80 A = ~A;


    seven_segment_led run(a, b, c, d, e, f, g, A, B, C, D);
endmodule

