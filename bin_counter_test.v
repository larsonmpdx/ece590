`timescale 1ns / 1ps

//

module bin_counter_test;

	// Inputs
	reg load;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] q;
	wire [3:0] qbar;

	// Instantiate the Unit Under Test (UUT)
	bin_counter uut (
		.q(q), 
		.qbar(qbar), 
		.load(load), 
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		load = 1;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
        
		// Add stimulus here

	end
      
	always
			#1 clk = !clk;
endmodule

