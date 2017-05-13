//////////////////////////////////////////////////////////////////////////////////
// Create Date: 05/12/2017 10:50:00 PM
// Designer Name:Parimala Jyothi Mandalapu 
// Module Name: FullSub
//////////////////////////////////////////////////////////////////////////////////

module FullSub(A,B,Ca,S,Cout,tp);
parameter Width = 64;
parameter Pulse_Width = 21 * Width ;
input [Width - 1 : 0] A,B;
input Ca;
input [Pulse_Width - 1 :0]tp;
output [Width - 1 : 0] S;
output Cout;

	logic [7:0] one =8'b00000001;
	logic zero = 1'b0;
	wire out_onescomp, out_twoscomp, U1_cout; 
	ones_comp U0 (.B(B), .T(tp),.Bbar(out_onescomp));
	Adder8bit U1(.In1(one), .In2(out_onescomp), .Ca(zero), .S(out_twoscomp), .Cout(U1_cout), .tp(tp));
	Adder8bit U2( .In1(A), .In2(out_twoscomp), .Ca(Ca), .S(S), .Cout(Cout), .tp(tp) );	

endmodule


