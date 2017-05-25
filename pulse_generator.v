//Created by : Satya Keerthi Vendra 
//Date: 04/30/2017 
//
//Module Description :Pulse generator
//
//
//
/////////////////////////////////////////////////////////

module pulse_generator(
input clk,
input reset,
output reg [167:0] T_reg
);

integer i,j;
reg [167:0] T;


	

reg load;
wire [7:0] bincount;
wire [7:0] bincount_bar;

always @(*)
begin 
		if(reset)
		begin
			T_reg <= 0;
			//next_state <= S0;
			load <= 0;
		end
		else 
		begin 
			load <= 1;
			T_reg <= T;
			
		end

end

always @ (*)
begin
	if(bincount == 8'd167)
			begin
				T[167] <= 1;
				{T[166:0]} <= 0; 

			end
			else if(bincount == 0)
			begin
				T[0] <= 1;
				{T[167:1]} <= 0;
			end
			else
			begin
				T[bincount] <= 1;
				for( i = 167; i >= bincount + 1; i = i - 1)
				begin
					T[i] <= 0;
				end
				for(j = 0; j <= bincount - 1; j = j + 1)

				begin
					T[j] <= 0;
				end
			end
			
	

end
bin_counter binarycount(
	.q(bincount),
	.qbar(bincount_bar),
	.load(load),
	.clk(clk),
	.reset(reset));
endmodule