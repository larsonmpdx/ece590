//////////////////////////////////////////////////////////////////////////////////
// Create Date: 05/12/2017 11:00:00 PM
// Designer Name:Parimala Jyothi Mandalapu 
// Module Name: ones_comp
//////////////////////////////////////////////////////////////////////////////////

module ones_comp(B,T,Bbar);
parameter n_bits=8;	
parameter pulses=9;


input [n_bits-1:0]B;
input [pulses-1:0] T;		

output [n_bits-1:0] Bbar;

wire [n_bits-1:0] S,p,Q,Qbar;

genvar i;
generate

for (i = 0; i <= n_bits-1; i = i+1)		//to generate ones compliment for each bit
begin
not g1 (p[i], B[i]);	
and g2 (S[i], T[i+1], p[i]);		

nor (Q[i], T[0], Qbar[i]); 
nor (Qbar[i], S[i], Q[i]);	//SR latch

assign Bbar[i] = Q[i];

end
endgenerate

endmodule
