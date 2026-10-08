//vector0
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); 
assign outv = vec;
    assign o2 = vec[2];
    assign o1 = vec[1];
    assign o0 = vec[0];
endmodule

//vector1
`default_nettype none     
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
endmodule

//vector2 
module top_module( 
    input [31:0] in,
    output [31:0] out );
    assign out = { in[7:0], in[15:8], in[23:16], in[31:24] };
endmodule
//vectorgates
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_not = {~b,~a};
    assign out_or_bitwise = a | b;
    assign out_or_logical = a || b;
endmodule

//four input gates 
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = in[3] & in[2] & in[1] & in[0];
    assign out_or = in[3] | in[2] | in[1] | in[0];
    assign out_xor = in[3] ^ in[2] ^ in[1] ^ in[0];
    
endmodule
//vector 3
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );
    assign {w, x, y, z} = { a, b, c, d, e, f, 2'b11};


endmodule
//vectorr
module top_module( 
    input [7:0] in,
    output [7:0] out
);
    assign out = {in[0] , in[1], in [2], in [3], in [4], in [5] , in [6] , in [7]};
endmodule
