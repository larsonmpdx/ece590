
module top(
input [7:0] A,B,
input clk,reset,
input Cin,
output [7:0]Sum,
output Cout );

//wire [3 : 0] q;
//wire [3 : 0] qbar;

wire [168:0] tp;


Adder8bit add(.In1(A),.In2(B),.Ca(Cin),.S(Sum),.Cout(Cout),.tp(tp));
pulse_generator pg (.clk(clk),.reset(reset),.T_reg(tp));
endmodule
