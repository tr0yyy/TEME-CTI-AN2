module HelloWorld;
    initial begin
       $display("Hello World from Verilog!");
       #10 $finish; 
    end
endmodule // HelloWorld