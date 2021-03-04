module mynand(q, a, b);
    input a, b;
    output q;

    assign q = ~(a&b);

endmodule //mynand

module mynand_tb;
    reg a, b;
    wire w1, w2, q;
    initial begin
        $dumpfile("nand.vcd");
        $dumpvars;
        a = 0;
        b = 0;
        #5 a = 1;
        #5 b = 1;
        #5 a = 0;
        #10 $finish;
    end 

    initial begin
        $monitor("time=%0d, a=%b , b=%b, q=%b", $time, a, b, q);
    end

    mynand n1(w1, a, a);
    mynand n2(w2, b, b);
    mynand n3(q, w1, w2);

endmodule // mynand_tb