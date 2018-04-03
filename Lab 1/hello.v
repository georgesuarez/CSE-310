module hello_world;

    reg [15:0] a;
    reg [15:0] b;

    wire [15:0] s;

    Sum sumTest ( .a( a ), .b ( b ), .s ( s ) );

initial begin
    a = 2;
    b = 2;
    $display ("CSUSB CSE 310 is fun!");
    $monitor (" The sum of %d and %d is %d", a, b, s);
    #80 $finish;
end

endmodule