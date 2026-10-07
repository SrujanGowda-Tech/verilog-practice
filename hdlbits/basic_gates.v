// Step one
module top_module( output one );
    assign one = 1'b1;
endmodule

// Zero
module top_module( output zero );
    assign zero = 1'b0;
endmodule

// Inverter
module top_module( input in, output out );
    assign out = ~in;
endmodule

//simple wire
module top_module( input in, output out );
assign out = in ;
endmodule

//four wire
module top_module( 
    input a,b,c,
    output w,x,y,z );
      assign w = a;
      assign x = b;
      assign y = b;
      assign z = c;
endmodule

//and 
module top_module( 
    input a, 
    input b, 
    output out );
assign out = a & b;
endmodule

//nor
module top_module( 
    input a, 
    input b, 
    output out );
    assign out = ~(a|b) ;
endmodule

//xnor
module top_module( 
    input a, 
    input b, 
    output out );
    assign out = ~ (a^b) ;
endmodule

//declaring wires
`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
wire and1 , and2;
    assign and1 = a&b;
    assign and2 =c&d;
    assign out =  and1 | and2;
    assign out_n = ~ (and1 | and2 );
endmodule

//7458 chip
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire and1 ,and2 , and3 , and4 ;
assign and1 = p1a & p1b & p1c;
    assign and2 = p1d & p1e & p1f;
    assign and3 = p2a & p2b;
    assign and4 = p2d & p2c;
    assign p1y = and1|and2;
    assign p2y = and3|and4;
endmodule

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
