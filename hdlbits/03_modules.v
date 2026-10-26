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

//adder1
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire c;

    add16 lower ( .a(a[15:0]),  .b(b[15:0]),  .cin(1'b0), .sum(sum[15:0]),  .cout(c) );
    add16 upper ( .a(a[31:16]), .b(b[31:16]), .cin(c),    .sum(sum[31:16]), .cout()  );

endmodule

module add1 ( input a, input b, input cin, output sum, output cout );

    assign sum  = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;

endmodule

//full adder
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire c;

    add16 lower ( .a(a[15:0]),  .b(b[15:0]),  .cin(1'b0), .sum(sum[15:0]),  .cout(c) );
    add16 upper ( .a(a[31:16]), .b(b[31:16]), .cin(c),    .sum(sum[31:16]), .cout()  );

endmodule

module add1 ( input a, input b, input cin, output sum, output cout );

    assign sum  = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;

endmodule
//Module cseladd
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_low;
    wire [15:0] sum_high0, sum_high1;
    wire carry_low, carry_high0, carry_high1;

    add16 u1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_low),
        .cout(carry_low)
    );
    add16 u2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_high0),
        .cout(carry_high0)
    );
    add16 u3 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_high1),
        .cout(carry_high1)
    );
    assign sum[15:0]  = sum_low;
    assign sum[31:16] = carry_low ? sum_high1 : sum_high0;

endmodule
//Module addsub
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b_mod;
    wire carry;
    assign b_mod = b ^ {32{sub}};
    add16 u1 (
        .a(a[15:0]),
        .b(b_mod[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(carry)
    );
    add16 u2 (
        .a(a[31:16]),
        .b(b_mod[31:16]),
        .cin(carry),
        .sum(sum[31:16]),
        .cout()
    );

endmodule
