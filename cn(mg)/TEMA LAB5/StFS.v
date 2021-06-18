/*
    Implementam un scazator complet folosind design-ul structural prin
    implemnetarea intr-un prim pas a unui semiscazator
        D = A ^ B ^ Ci = xor(A, xor(B, Ci))
        Bo = ~A&B = and(not(A), B)
    dupa care definim un nou modul ce leaga cele 2 semisumatoare in 
    modul in care am prezentat pe tabla asociata acestui laborator
    si un testbentch similar cu cel  folosit in cazul implementarii
    realizate cu modul comportamental (functionalitatile sunt identice)
*/

module StHS(Bo, D, A, B);
    input A, B;
    output reg Bo, D;

    always @ (A or B) begin
      D = A ^ B;
      Bo = ~A&B;
    end
endmodule // StHS

module StFS(Bo, D, A, B, Bi);
    input A, B, Bi;
    output Bo, D;
    wire d0, b0, b1;

    StHS hs1(b0, d0, A, B);
    StHS hs2(b1, D, d0, Bi);
    assign Bo = b0|b1;
endmodule // StFS

module StFS_tb;
  input [3:0] A, B;
  input Bi;
  output [3:0] D;
  output B0;

    reg [3:0] a, b, bi, c;
    wire [3:0] bo, s;

  initial begin
  $dumpfile("StFS.vcd");
  $dumpvars;
      a = 0;
      b = 0; 
      bi = 0;
      #10 begin
          a = 0;
          b = 0; 
          bi = 1;
      end
      #10 begin
          a = 0;
          b = 1;
          bi = 0;
      end
      #10 begin
          a = 0;
          b = 1;
          bi = 1;
      end
      #10 begin
          a = 1;
          b = 0;
          bi = 0;
      end
      #10 begin
          a = 1;
          b = 0;
          bi = 1;
      end
      #10 begin
          a = 1;
          b = 1;
          bi = 0;
      end
      #10 begin
          a = 1;
          b = 1;
          bi = 1;
      end
      #10 $finish;
    end

  StFS sfs0(w1, D[0], A[0], B[0], Bi); 
  StFS sfs1(w2, D[1], A[1], B[1], Bi);
  StFS sfs2(w3, D[2], A[2], B[2], Bi);
  StFS sfs3(Bo, D[3], A[3], B[3], Bi);   
endmodule // STFS_Tb
