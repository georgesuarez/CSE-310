`timescale 1ns / 1ps

module dec3x8_tb;

    reg [2:0] A;

    wire [7:0] Y;

    dec3x8 uut ( .Y(Y), .A(A) );

    always begin
        A = 3'b000;
    #10 A = 3'b001;
    #10 A = 3'b010;
    #10 A = 3'b011;
    #10 A = 3'b100;
    #10 A = 3'b101;
    #10 A = 3'b110;
    #10 A = 3'b111;

    #20 $finish;
  end

  initial begin
    
    $display("Time \t A2 A1 A0  \t Y7 Y6 Y5 Y4 Y3 Y2 Y1 Y0");
    $monitor("%g \t %b   %b  %b \t %b  %b  %b  %b  %b  %b  %b  %b "
    , $time , A[2], A[1], A[0], Y[7], Y[6], Y[5], Y[4], Y[3], Y[2], Y[1], Y[0] );

    #90 $finish;
 end
endmodule