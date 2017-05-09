`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 05/04/2017 10:55:57 PM
// Designer Name: Hiral Barot
// Module Name: FA
//////////////////////////////////////////////////////////////////////////////////

module FA(input A,B,Cin,t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,output Sum,Cout);
          wire out1,out2,out3;
          main_xor xor1(.M(out1),.A(A),.B(B),.t0(t0),.t1(t1),.t2(t2),.t3(t3),.t4(t4),.t5(t5),.t6(t6),.t7(t7),.t8(t8),.t9(t9));
          main_xor xor2(.M(Sum),.A(out1),.B(Cin),.t0(t10),.t1(t12),.t2(t13),.t3(t14),.t4(t15),.t5(t16),.t6(t17),.t7(t18),.t8(t19),.t9(t20));
          main_and and1(.AND(out2), .A(out1), .B(Cin), .t0(t10),.t1(t11),.t2(t12),.t3(t13));
          main_and and2(.AND(out3), .A(A), .B(B), .t0(t0),.t1(t1),.t2(t2),.t3(t3));
          main_or or1(.OR(Cout), .A(out2),.B(out3),.t0(t14),.t1(t15),.t2(t16),.t3(t17),.t4(t18)); 
          endmodule 