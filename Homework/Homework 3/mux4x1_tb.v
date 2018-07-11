module mux4x1_tb();

    reg in0, in1, in2, in3;
    reg en;

    wire F;

    mux4x1 uut ( F, en, in3, in2, in1, in0 );

    always
        #5 en = ~en;
    always
        #10 in3 = ~in3;
    always
        #20 in2 = ~in2;
    always
        #40 in1 = ~in1;
    always
        #80 in0 = ~in0;
    
    initial begin
        in0 = 0;
        in1 = 0;
        in2 = 0;
        in3 = 0;
        en = 0;

        $display("Time \t en in0 in1 in2 in3  F");
        $monitor("%g   \t %d   %d   %d   %d   %d   %d", 
        $time, en, in0, in1, in2, in3, F);

        #100 $finish;
    end
endmodule
