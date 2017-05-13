//////////////////////////////////////////////////////////////////////////////////
// Create Date: 05/12/2017 11:00:00 PM
// Designer Name:Parimala Jyothi Mandalapu 
// Module Name: tb_onescomp
//////////////////////////////////////////////////////////////////////////////////

module tb_onescomp;
parameter n_bits=8;
parameter pulses=9;
integer i =0;


wire  [n_bits-1:0] Bbar;
reg  [n_bits-1:0] B;
reg [pulses-1:0] T;


ones_comp U0(.B(B),.T(T),.Bbar(Bbar));

initial begin

B[0]=1'b0;
B[1]=1'b0;
B[2]=1'b0;
B[3]=1'b0;
B[4]=1'b0;
B[5]=1'b0;
B[6]=1'b0;
B[7]=1'b0;
B[8]=1'b0;


T[0] =1'b0;
T[1] = 1'b1;
T[2] = 1'b1;
T[3] = 1'b1;
T[4] = 1'b1;
T[5] = 1'b1;
T[6] = 1'b1;
T[7] = 1'b1;
T[8] = 1'b1;
T[9] = 1'b1;

end
endmodule
