/*
    Implementam prin modalitatea comporamentala un scazator complet
    {Bo, D} = A - B - Ci
*/

module BeFS(Bo, D, A, B, Bi);
    input [3:0] A, B, Bi;
    output [3:0] Bo, D;

    assign {Bo, D} = A - B - Bi;

endmodule

module BeFS_tb;
    reg [3:0] a, b, bi;
    wire [3:0] bo, d;

    initial begin
      $dumpfile("BeFS.vcd");
      $dumpvars;
      a = 0;
      b = 0;
      bi = 0;       // 0 0 0
      #10 bi = 1;   // 0 0 1
      #10 b = 1;    // 0 1 1
      #10 bi = 0;   // 0 1 0
      #10 a = 1;    // 1 1 0
      #10 bi = 1;   // 1 1 1
      #10 b = 0;    // 1 0 1
      #10 bi = 0;   // 1 0 0
      #10 $finish;
    end

     BeFS sub1(bo, d, a, b, bi);
endmodule // BeFS_tb
