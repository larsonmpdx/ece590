module main_and(
              output  AND, input wire A,B,t0,t1,t2,t3
              );
              
wire Abar,Bbar;
wire p1,p2,p3,p4,Y,Ybar,X,Xbar;
not x1(Abar, A);                //A'
not x2(Bbar, B);                //B'

and x3(p1,t1,Bbar);  //t2B'
and x4(p2,t2,Abar);  //t3A'
or x5(p3,p1,p2);     //t2B'+t3A'

nor (X,t0,Xbar);
nor (Xbar, p3,X);

and x6(p4,t3,Xbar);

nor (Y,t0,Ybar);
nor (Ybar,p4,Y);
 
assign AND=Y;
endmodule
