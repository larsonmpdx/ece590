`timescale 1ns / 1ps

//

module connection_table_test;

parameter DATA_WIDTH = 6;
parameter NODE_ADDRESS_SIZE = 4;
parameter ARRAY_LENGTH = 1 << (NODE_ADDRESS_SIZE * 2);

	// Inputs
	reg CLK;
	reg [DATA_WIDTH-1:0] IN;
	reg [NODE_ADDRESS_SIZE-1:0] node_A;
	reg [NODE_ADDRESS_SIZE-1:0] node_B;
	reg write_enable;
	reg chip_select;

	// Outputs
	wire [DATA_WIDTH-1:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	connection_table uut (
		.CLK(CLK),
		.IN(IN),
		.node_A(node_A),
		.node_B(node_B),
		.write_enable(write_enable),
		.chip_select(chip_select),
		.OUT(OUT)
	);

	reg [DATA_WIDTH-1:0] value_written;

	initial begin
		// Initialize Inputs
		CLK = 0;
		node_A = 0;
		node_B = 0;

		// Wait 100 ns for global reset to finish
		#100;

		// test cases
		value_written = 42;
		node_A = 172;
		node_B = 10;
		IN = value_written;
		write_enable = 1;
		chip_select = 1;
		CLK = !CLK;

		#1
		CLK = !CLK;
		#1;
		node_A = 172;
		node_B = 10;
		write_enable = 0;
		chip_select = 1;
		CLK = !CLK;
		#1

		if (OUT != value_written) begin
			$display ("error, read value different than written value", $time);
			$display (" Expected %d, Got %d", value_written, OUT);
			$finish;
		end

	end

endmodule
