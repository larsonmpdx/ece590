`timescale 1ns / 1ps

module tb;
parameter iterations=8;
parameter Pulse_Width = iterations *21;
wire [iterations-1:0] Sum;
wire Cout;
reg [Pulse_Width - 1 :0]tp = 0;
reg [iterations-1:0]A,B;
reg Cin;
integer i=0;

Adder8bit #(iterations) dut(.In1(A),.In2(B),.Ca(Cin),.S(Sum),.Cout(Cout),.tp(tp));

initial begin 

A=8'd89;
B=8'd64;
Cin=1'b0;
tp[0] = 1'b1;

for(i=1;i<Pulse_Width;i=i+1)begin
    #10;
    tp[i] = 1'b1;
    tp[i-1]= 1'b0;
end
end
endmodule