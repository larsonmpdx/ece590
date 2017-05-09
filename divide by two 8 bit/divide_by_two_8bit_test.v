`timescale 1ns / 1ps

//

module divide_by_two_8bit_test;

	// Inputs
	reg load;
	reg CLK;
	reg reset;

	// Outputs
	wire [3:0] q;
	wire [3:0] qbar;

	// Instantiate counter
	bin_counter counter (
		.q(q), 
		.qbar(qbar), 
		.load(load), 
		.clk(CLK), 
		.reset(reset)
	);

	// Inputs
	reg [7:0] A;

	// Outputs
	wire [7:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	divide_by_two_8bit uut (
		.Q(q),
		.A(A),
		.RESET(reset),
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		CLK = 0;
		load = 1;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
      
		// Add stimulus here
		#1
		A = 55;
		#1
		CLK = !CLK;
		#1
		CLK = !CLK;
				#1
		CLK = !CLK;
				#1
		CLK = !CLK;
				#1
		CLK = !CLK;
				#1
		CLK = !CLK;
				#1
		CLK = !CLK;
				#1
		CLK = !CLK;
				#1
		CLK = !CLK;
				#1
		CLK = !CLK;
				#1
		CLK = !CLK;
		
		
	end
      
endmodule

