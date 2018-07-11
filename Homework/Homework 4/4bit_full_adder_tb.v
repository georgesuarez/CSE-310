module four_bit_full_adder_tb;
    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire Cout;
    wire [3:0] Sum;

    // Instantiate the Unit Under Test (UUT)
    ripple_carry_4_bit_adder uut(.Sum(Sum), .C4(Cout), .A(A), .B(B), .C0(Cin));

    initial
    begin
        $display("Time\t A \t B \t Cin \t | Sum \t Cout");
        $monitor("%3g\t %b \t %b \t %b \t | %b   %b", $time, A, B, Cin, Sum, Cout);

    end

    initial
    begin
        
        A = 0111; B = 0110; Cin = 0;
       #10 A = 1000; B = 1001; Cin = 0;
       #10 A = 1100; B = 1000; Cin = 1;
       #10 A = 0101; B = 1010; Cin = 1;
       #10 A = 0000; B = 0001; Cin = 1;
        
        
        #10 $finish;
    end
endmodule


