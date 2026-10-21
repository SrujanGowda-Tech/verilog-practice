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
