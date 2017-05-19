`timescale 1ns / 1ps

//

module connection_table(CLK, IN, node_A, node_B, write_enable, chip_select, OUT);

parameter DATA_WIDTH = 6;
parameter NODE_ADDRESS_SIZE = 4;
parameter ARRAY_LENGTH = 1 << (NODE_ADDRESS_SIZE * 2);

reg [DATA_WIDTH-1:0] connections[0:ARRAY_LENGTH-1]; // N entry array of DATA_WIDTH bit entries.  entry is connection strength
                                       // entry address is {node_A, node_B} (node A concatenated with node B)

input CLK;
input [DATA_WIDTH-1:0] IN;
input [NODE_ADDRESS_SIZE-1:0] node_A;
input [NODE_ADDRESS_SIZE-1:0] node_B;
input write_enable;
input chip_select;
output reg [DATA_WIDTH-1:0] OUT;

always @(posedge CLK)

	begin : READ
	  if ( write_enable && chip_select ) begin
		 connections[{node_A, node_B}] = IN;
	  end
	end

always @(posedge CLK)
	begin : WRITE
	  if ( !write_enable && chip_select ) begin
		 OUT = connections[{node_A, node_B}];
	  end
	end

endmodule
