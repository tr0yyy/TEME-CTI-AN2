/*
    L4 E1 Structural Counter

    Vom implementa un bistabil de tip T (FFT) si il vom testa prin implementarea unui numarator
    asincron (Ripple Counter) pe 4 biti.

*/

module FFT(q, qb, clk, rst, d, ld);
    input clk, rst, d, ld;
    output reg q;
    output wire qb;
    assign qb = ~q;
    always @(posedge clk or posedge rst or posedge ld) begin
        if (rst)
            q <= 1'b0;
        else if (ld)
            q <= d;
        else 
            q = ~q;
    end
endmodule // FFT

module FFT_tb;
    wire [3:0] q, qb;
    reg clk, rst, ld;
    reg [3:0] d;

    initial begin
      $dumpfile("FFT.VCD");
      $dumpvars;
      clk = 0;
      rst = 0;
      ld = 0;
      #10 rst = 1;
      #3 rst = 0;
      #280 d = 4'b1011;
      #5 ld = 1;
      #5 ld = 0;
      #500 $finish;
    end

    // generam semnalul de ceas
    initial begin
        forever begin
          #10 clk = ~clk;
        end  
    end

    FFT t0(q[0], qb[0], clk, rst, d[0], ld);
    FFT t1(q[1], qb[1], q[0], rst, d[1], ld);
    FFT t2(q[2], qb[2], q[1], rst, d[2], ld);
    FFT t3(q[3], qb[3], q[2], rst, d[3], ld);
endmodule // FFT_tb
