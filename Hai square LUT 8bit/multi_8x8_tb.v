
`timescale 1ns / 1ps

/*
	Name: Hai Dang Hoang
	Email: danghai@pdx.edu
	Module multiplication 8x8 bit (A^2)
*/

module multi_8x8_tb;

	// Inputs
	reg clk;
	reg [7:0] operand;

	// Outputs
	wire [15:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	multi_8x8 uut (
		.clk(clk),
		.operand(operand),
		.OUT(OUT)
	);
// Generate clock signal
always
begin
	clk <=1;
	#5;
	clk <=0;
	#5;
end

initial begin
		// Initialize Inputs
		clk = 0;
		operand = 0;
	
		@(negedge clk) operand=5;
		@(negedge clk) operand =12;
		@(negedge clk) operand =10;
		#5 $stop;

end
initial begin
	$monitor ($time, "  Expected value %d x %d = %d", operand, operand, OUT);

end

	
endmodule
