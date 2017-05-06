`timescale 1ns / 1ps

//

module divide_by_two_8bit(Q, A, RESET, OUT);
input [3:0] Q;
input [7:0] A;
input RESET;
output [7:0] OUT;

wire sr0_out;

wire temp;
assign temp = ((0 == 0) && 1) || 0;
SR_latch sr0 (temp,RESET,sr0_out,);

SR_latch sr1 (((Q == 1) && !sr0_out) || A[1],RESET,OUT[0],);
SR_latch sr2 (((Q == 2) && !sr0_out) || A[2],RESET,OUT[1],);
SR_latch sr3 (((Q == 3) && !sr0_out) || A[3],RESET,OUT[2],);
SR_latch sr4 (((Q == 4) && !sr0_out) || A[4],RESET,OUT[3],);
SR_latch sr5 (((Q == 5) && !sr0_out) || A[5],RESET,OUT[4],);
SR_latch sr6 (((Q == 6) && !sr0_out) || A[6],RESET,OUT[5],);
SR_latch sr7 (((Q == 7) && !sr0_out) || A[7],RESET,OUT[6],);

assign OUT[7] = 1'b0;
	
endmodule
