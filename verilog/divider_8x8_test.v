`timescale 1ns / 1ps

//

module divider_8x8_test;

	// Inputs
	reg CLK;
	reg [7:0] A;
	reg [7:0] B;

	// Outputs
	wire [7:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	divider_8x8 uut (
		.CLK(CLK),
		.A(A),
		.B(B),
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// test cases
		A = 100;
		B = 10;
		CLK = !CLK;

		#1
		CLK = !CLK;
		#1;
		A = 55;
		B = 2;
		CLK = !CLK;

		#1
		CLK = !CLK;
		#1;
		A = 255;
		B = 100;
		CLK = !CLK;

		#1
		CLK = !CLK;
		#1
		A = 55;
		B = 92;
		CLK = !CLK;

	end

	// expected behavior
	reg [7:0] output_compare;
	always @ (posedge CLK)
	begin
		if (B == 0)
			output_compare = 0;
		else
			output_compare = A / B;
	end

	// behavior check
	always @ (negedge CLK)
		if (output_compare != OUT) begin
		$display ("DUT Error at time %d", $time);
		$display (" Expected value %d / %d = %d, Got Value %d", A, B, output_compare, OUT);
		#5 $finish;
	end

endmodule
