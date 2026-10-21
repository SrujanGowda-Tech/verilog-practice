//module
module top_module ( input a, input b, output out );
    mod_a instance1 ( a, b, out );
endmodule 
//module pos
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a instance1 (out1, out2, a, b, c, d);
endmodule
// module_name
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a instance1 ( .out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d) );
endmodule
//module shift 
module top_module ( input clk, input d, output q );
 wire w1, w2;

    my_dff u1 ( .clk(clk), .d(d),  .q(w1) );
    my_dff u2 ( .clk(clk), .d(w1), .q(w2) );
    my_dff u3 ( .clk(clk), .d(w2), .q(q)  );
endmodule
//module shift8
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
wire [7:0] w1, w2, w3;
    my_dff8 dff1 (.clk(clk), .d(d),  .q(w1));
    my_dff8 dff2 (.clk(clk), .d(w1), .q(w2));
    my_dff8 dff3 (.clk(clk), .d(w2), .q(w3));

    always @(*) begin
        case (sel)
            2'b00: q = d;
            2'b01: q = w1;
            2'b10: q = w2;
            2'b11: q = w3;
        endcase
    end
endmodule
