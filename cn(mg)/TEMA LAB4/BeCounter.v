/*
Tema Laborator 4

Implementati testbentch pentru modulul behavioral cu 4 biti.
Implementati doar numararea ascendenta sau descendenta si incarcati fisierul v si fisierul VCD.
*/

module BeCounter(out,clk,rst,ld,up,d);
    output [3:0] out;
    input [3:0] d;
    input clk, rst, ld, up;
    reg[3:0] cnt;

    always @(posedge clk) begin
        if (rst)
            cnt <= 4'b0000;
        else if (ld)
            cnt = d;
        else if (up)
            cnt = cnt+1;
        else
            cnt = cnt-1;
    end
    assign out = cnt;
endmodule


module BeCounter_tb;
    reg [3:0] d;
    wire [3:0] out;
    reg clk; 
    reg rst;
    reg ld;
    reg up;

    initial begin
        $dumpfile("BeCounter.VCD");
        $dumpvars;
        clk=0;
        rst=0;
        ld=0;
        up=1;
        #10 rst=1;
        #20 rst=0;
        #20 rst=1;
        #10 up=0;
        #220 rst=0;
        #50 d=4'b1010;
        #10 ld=1'b1;
        #10 ld=0;
        #400 $finish;
       
    end

    initial begin
        forever begin
          #10 clk= ~clk;
        end
    end


    initial begin
        $monitor("clock=%0d, out=%b, rst=%b, ld=%b, up=%b , d=%b", clk, out,rst,ld,up,d);
    end

    BeCounter bec(out,clk,rst,ld,up,d);

endmodule