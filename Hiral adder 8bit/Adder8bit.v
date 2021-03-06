//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 05/06/2017 07:53:20 PM
// Designer Name:Hiral Barot
// Module Name: Adder8bit
//////////////////////////////////////////////////////////////////////////////////

module Adder8bit(In1,In2,Ca,S,Cout,tp);
parameter Width = 64;
parameter Pulse_Width = 21 * Width ;
input [Width - 1 : 0] In1,In2;
input Ca;
input [Pulse_Width - 1 :0]tp;
output [Width - 1 : 0] S;
output Cout;
wire  Cint[Width - 1:0];

FA f (.A(In1[0]),.B(In2[0]),.Cin(Ca),.Sum(S[0]),.Cout(Cint[0]),.t0(tp[0]),.t1(tp[1]),.t2(tp[2]),.t3(tp[3]),.t4(tp[4]),.t5(tp[5]),.t6(tp[6]),.t7(tp[7]),.t8(tp[8]),.t9(tp[9]),.t10(tp[10]),.t11(tp[11]),.t12(tp[12]),.t13(tp[13]),.t14(tp[14]),.t15(tp[15]),.t16(tp[16]),.t17(tp[17]),.t18(tp[18]),.t19(tp[19]),.t20(tp[20]));

	// Generating N instances of i bit full adders
	genvar i;
	generate
		 for (i = 1 ; i <= Width-1; i = i+1)
			FA f(.A(In1[i]),.B(In2[i]),.Cin(Cint[i - 1]),.Sum(S[i]),.Cout(Cint[i]),.t0(tp[(20*i)+1]),.t1(tp[(20*i)+2]),.t2(tp[(20*i)+3]),.t3(tp[(20*i)+4]),.t4(tp[(20*i)+5]),.t5(tp[(20*i)+6]),.t6(tp[(20*i)+7]),.t7(tp[(20*i)+8]),.t8(tp[(20*i)+9]),.t9(tp[(20*i)+10]),.t10(tp[(20*i)+11]),.t11(tp[(20*i)+12]),.t12(tp[(20*i)+13]),.t13(tp[(20*i)+14]),.t14(tp[(20*i)+15]),.t15(tp[(20*i)+16]),.t16(tp[(20*i)+17]),.t17(tp[(20*i)+18]),.t18(tp[(20*i)+19]),.t19(tp[(20*i)+20]),.t20(tp[(20*i)+21]));				
	endgenerate

assign Cout = Cint[Width-1];

endmodule

