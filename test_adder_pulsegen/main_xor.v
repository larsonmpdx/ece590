`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 05/05/2017 11:32:53 AM
// Designer Name: Hiral Barot 
// Module Name: main_xor
//////////////////////////////////////////////////////////////////////////////////

module main_xor( output M,
                 input A,B,t0, t1,t2,t3,t4,t5,t6,t7,t8,t9);
    
    wire Abar, Bbar,X,Xbar,Y,Ybar,Z,Zbar,U,Ubar;
    wire p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13;
    
    not(Abar,A);
    not(Bbar, B);
    
    //latch  X
    and(p1,t1,Abar);
    or(p2,t0,t8);
    nor(X,p2,Xbar);
    nor(Xbar,p1,X);
    
    //latch y
    and(p3,t2,Bbar);
    or(p4,t0,t5);
    nor(Y,p4,Ybar);
    nor(Ybar,p3,Y);
    
    //latch z
    and(p5, t3,Abar);
    and(p6, t4,Ybar);
    and(p7,t7,Xbar);
    and(p8,t8,Bbar);
    or(p9,p5,p6,p7,p8);
    or(p10,t0,t6);
    nor(Z, p10,Zbar);
    nor(Zbar, p9,Z);
    
    //latch U 
    and(p11,t5,Zbar);
    and(p12,t9,Zbar);
    or(p13,p11,p12);   
    nor(U, t0,Ubar);
    nor(Ubar, p13,U);
   
   assign M = U;//xor output
   
endmodule
