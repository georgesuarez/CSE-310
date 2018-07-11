// half adder
module HA ( output S, C, input A, B );
  xor ( S, A, B );
  and ( C, A, B );
endmodule

//full adder
module FA ( output S, C, input A, B, Cin );
  wire S1, C1, C2;
  
  HA ha1(S1, C1, A, B);
  HA ha2(S, C2, S1, Cin);
  or G1(C, C2, C1);
endmodule

module stimulus ();

    reg A, B, Cin;
    wire Cout, S;

    initial begin
        $display("time\t  A \t B \t Cin \t Cout \t S");
        $monitor("%g\t %b \t %b \t %b \t %b \t %b", $time, A, B, Cin, Cout, S);
    end


