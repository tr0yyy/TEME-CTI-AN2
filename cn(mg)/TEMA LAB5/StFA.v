/*
    Implementam un sumator complet folosind modul de design comportamental
    S = A ^ B ^ Ci = xor(xor(A, B), Ci)
    Co = A&B|(A&B)&Ci = or(and(A,B), and(and(A,B),Ci))
*/

module StFA(Co, S, A, B, Ci);
    output reg Co, S;
    input A, B, Ci;

    always @ (A or B or Ci) begin
      S = A ^ B ^ Ci;
      Co = A&B|(A&B)&Ci;
    end

endmodule // BeFA

module StFA_tb;
  input [3:0] A, B;
  input Ci;
  output [3:0] D;
  output C0;

  reg [3:0] a, b, ci;
  wire [3:0] co, s;

  initial begin
   $dumpfile("StFA.vcd");
    $dumpvars(1, a, b, ci, co, s);
      a = 0;
      b = 0;        //  a b c
      ci = 0;       //  0 0 0
      #10 ci = 1;   //  0 0 1
      #10 b = 1;    //  0 1 1
      #10 ci = 0;   //  0 1 0
      #10 a = 1;    //  1 1 0
      #10 ci = 1;   //  1 1 1
      #10 b = 0;    //  1 0 1
      #10 ci = 0;   //  1 0 0
      #10 $finish;
    end
   
  StFA sfa0(w1, D[0], A[0], B[0], Ci); 
  StFA sfa1(w2, D[1], A[1], B[1], Ci);
  StFA sfa2(w3, D[2], A[2], B[2], Ci);
  StFA sfa3(Co, D[3], A[3], B[3], Ci);   
endmodule // BeFA_tb


