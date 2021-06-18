/*
    Implementam un sumator complet folosind modul de design comportamental
    (Co,S) = A + B + Ci
*/

module BeFA(Co, S, A, B, Ci);
    output  [3:0] Co, S;
    input [3:0] A, B, Ci;

    assign {Co, S} = A + B + Ci;
endmodule // BeFA

module BeFA_tb;
    reg [3:0] a, b, ci;
    wire [3:0] co, s;
    initial begin
      $dumpfile("BeFA.vcd");
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

      // inca de 3 ori 

      #10 ci = 1;   //  0 0 1
      #10 b = 1;    //  0 1 1
      #10 ci = 0;   //  0 1 0
      #10 a = 1;    //  1 1 0
      #10 ci = 1;   //  1 1 1
      #10 b = 0;    //  1 0 1
      #10 ci = 0;   //  1 0 0

      #10 ci = 1;   //  0 0 1
      #10 b = 1;    //  0 1 1
      #10 ci = 0;   //  0 1 0
      #10 a = 1;    //  1 1 0
      #10 ci = 1;   //  1 1 1
      #10 b = 0;    //  1 0 1
      #10 ci = 0;   //  1 0 0


      
      #10 $finish;
    end

    BeFA fadd(co, s, a, b, ci);
endmodule // BeFA_tb

