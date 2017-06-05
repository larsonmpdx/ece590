`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 05/05/2017 11:58:48 AM
// Designer Name:Hiral Barot 
// Module Name: main_or
//////////////////////////////////////////////////////////////////////////////////

module main_or(
                output  OR, 
                input wire t0,t1, t2, t3, t4, A, B
   );
   
   wire Abar, Bbar;
   wire x1,x2,x3,x4,x5,x6,X,Xbar,Y,Ybar,Z,Zbar;
   not (Abar, A);
   not (Bbar, B);
   
   and (x1,t1,Abar);       //x1= t2.Abar
   or (x2, t0, t4);        //x2= t1+t5
   
   nor (X, x2, Xbar);      // output of 1st SR latch is X and Xbar
   nor (Xbar, x1, X);
   
   and (x3, t3, Bbar);     //x3= t4.Bbar
   
   nor (Y, t0, Ybar);      // output of 2nd SR latch is Y and Ybar
   nor (Ybar, x3, Y);
   
   and (x4, t2, Xbar);     // x4=t3.Xbar
   and (x5, t4, Ybar);     // x5=t5.Ybar
   or (x6, x4, x5);        // x6=t3.Xbar + t5.Ybar
   
   nor (Z, t0, Zbar);      // output of 3rd SR latch is Z and Zbar
   nor (Zbar,x6 , Z);
   
   assign OR = Z;
endmodule
