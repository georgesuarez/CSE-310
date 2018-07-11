module mux2x1_tb();

    reg en, in0, in1;

    wire F;

    mux2x1 uut ( F, en, in1, in0 );

    always
        #5 in0 = ~in0;
    always
        #10 in1 = ~in1;
    always
        #20 en = ~en;

    initial
    begin
        in0 = 0;
        in1 = 0;
        en = 0;

        $display("Time \t   en   in1    in0     F");
        $monitor("%g   \t   %d     %d      %d      %d ", $time, en, in1, in0, F);

        #30 $finish;
        end
endmodule