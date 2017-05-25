//bin_counter.v module - binary counter for pulse generator state machine
//Created by : Satya Keerthi
//Date : 04/30/2017
//
//Description : This is a 4 bit binary counter that counts starting from 0 to 15 and restarts from 0 after count 15.            
// This module will be used in association with the state machine of the pulse generator to generate 16 pulses. 
// Note: To increase the number of required pulses, instantiate the tflipflop module and "and" module once again and increase
// the output bit vector length. One bit will give many additional pulses. Also add a new state to the state machine. 

module bin_counter (q,qbar,load,clk,reset);
	output [7 : 0] q;
	output [7: 0] qbar;
	input load,clk,reset;
	wire [5:0] temp;
		
		tflipflop ff1 (q[0],qbar[0],load, clk,reset);
		tflipflop ff2 (q[1],qbar[1],q[0], clk,reset);
		
		and (temp[0],q[0],q[1]);
		tflipflop ff3 (q[2],qbar[2],temp[0], clk,reset);
		
		and (temp[1],q[2],temp[0]);
		tflipflop ff4 (q[3],qbar[3],temp[1], clk,reset);
		
		and (temp[2],q[3],temp[1]);
		tflipflop ff5 (q[4],qbar[4],temp[2], clk,reset);
		
		and (temp[3],q[4],temp[2]);
		tflipflop ff6 (q[5],qbar[5],temp[3], clk,reset);
		
		and (temp[4],q[5],temp[3]);
		tflipflop ff7 (q[6],qbar[6],temp[4], clk,reset);
		
		and (temp[5],q[6],temp[4]);
		tflipflop ff8 (q[7],qbar[7],temp[5], clk,reset);
endmodule

module tflipflop (q,qbar,t,clk,reset);
	output q,qbar;
	input t,clk,reset;
	reg q,qbar;
		initial 
			begin 
				q = 1'b0;
				qbar = 1'b1;
			end
		always @ (posedge clk)
			if (reset)begin
				q = 1'b0;
				qbar = 1'b1;
			end
			else
				begin
				q = t^q;
				qbar = ~q;
			end
endmodule