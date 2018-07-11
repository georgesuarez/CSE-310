`timescale 1ns / 1ps

module mux8x1_tb();

    reg [0:7] in;
    reg [1:0] en;

    wire F;

    mux8x1 uut(F, in, en);

    initial begin

        $display ("Time\ten\t   in  \t\tF");
        $monitor ("%g\t%b\t%b\t%b", $time, en, in, F);
        #50 $finish;

    end

    initial begin
        en=2'b00; in=8'b00000000;
        #10 en=2'b10; in=8'b10000000;
        #10 en=2'b01; in=8'b11111111;
        #10 en=2'b01; in=8'b00000100;
        #10 en=2'b10; in=8'b10100000;
        #10 en=2'b01; in=8'b11100100;
        #10 $finish;
    end
endmodule