module my_seqDesign_tb;

    reg ck;
    reg rst;

    wire [2:0] Q;
    wire I;

    mySeqDesign uut (.ck(ck), .rst(rst), .I(I), .Q(Q));

    initial
    begin
        $display ("time\t Clk Q[1] Q[0]");
        $monitor ("%g\t %b %2b ", $time, ck, Q);
    end

    initial
    begin
        ck = 1'b1;
        rst = 1'b1;
        #2 rst = 1'b0;
    end

    initial #260 $finish;
    always #10 ck = ~ck;
endmodule