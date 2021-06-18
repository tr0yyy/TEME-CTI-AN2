module Encoder(in, out);
    
    input[6:0] in;
    output[3:0] out;
    reg[3:0] out; 

    always@(in)
    begin
        case(in)
            7'b1111110 : out = 4'b0000;
            7'b0110000 : out = 4'b0001;
            7'b1101101 : out = 4'b0010;
            7'b1111001 : out = 4'b0011;
            7'b0110011 : out = 4'b0100;
            7'b1011011 : out = 4'b0101;
            7'b1011111 : out = 4'b0110;
            7'b1110000 : out = 4'b0111;
            7'b1111111 : out = 4'b1000;
            7'b1110011 : out = 4'b1001; // in tabelul din examen, pentru outputul 9, reprezentarea in 7 biti este de la 3.
                                        // 1110011 afiseaza corect 9, conform vcd.
        endcase    
    end

endmodule

module Testbench;

    reg[6:0] A;
    wire[3:0] Display;

    initial begin
        $dumpfile("subiectul2.vcd");
        $dumpvars;

        A = 7'b1111110;
        
        #10 A = 7'b0110000;
        #10 A = 7'b1101101;
        #10 A = 7'b1111001;

        #10 A = 7'b0110011;
        #10 A = 7'b1011011;
        #10 A = 7'b1011111;
        
        #10 A = 7'b1110000;
        #10 A = 7'b1111111;
        #10 A = 7'b1110011;
        
        #10 $finish;
    end

    initial begin
        $monitor("Input 7 biti: %b, Output 4 biti: %b", A, Display);
    end

    Encoder encoder(A, Display);

endmodule