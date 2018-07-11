// name: four_bit_adder_subtracter
// desc: four bit ripple carry adder/subtracter
//       [Cout,S] = A+B if M=0      (add)
//       [Cout,S] = A-B if M=1      (subtract)
// date: 
// by  : 
module four_bit_adder_subtracter(S,Cout,A,B,M);
   input  M;
   input  [3:0] A,B;
   output Cout;
   output [3:0] S;
   wire C0,C1,C2;  //Intermediate carries
   wire [3:0] T;   //XOR outputs

   xor        X0(T[0], M, B[0]),
              X1(T[1], M, B[1]),
              X2(T[2], M, B[2]),
              X3(T[3], M, B[3]);

   FA         FA0 (S[0],C0,A[0],T[0],M),
              FA1 (S[1],C1,A[1],T[1],C0),
              FA2 (S[2],C2,A[2],T[2],C1), 
              FA3 (S[3],Cout,A[3],T[3],C2);

endmodule