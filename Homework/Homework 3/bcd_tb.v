`timescale 1ns / 1ps

module bcd_tb();

    reg w, x, y, z;
    output a, b, c, d;

    initial
        begin

            $display("Time\t w    x  y  z |  a b c d");
            $monitor("%g\t %b    %b  %b  %b |  %b %b %b %b", 
            $time, w, x, y, z, a, b, c, d);
    end

    initial
        begin

            w = 1'b0;
            x = 1'b0;
            y = 1'b0;
            z = 1'b0;
        
            #150 $finish;
    end

    
        always #10 z = ~z;
        always #20 y = ~y;
        always #40 x = ~x;
        always #80 w = ~w;


    GBC run(a, b, c, d, w, x, y, z);
endmodule

