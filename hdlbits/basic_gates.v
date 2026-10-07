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
