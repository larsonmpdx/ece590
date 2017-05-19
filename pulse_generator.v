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
output reg [0:15] T
);

localparam [3:0]
	S0 = 4'b0000,
	S1 = 4'b0001,
	S2 = 4'b0010,
	S3 = 4'b0011,
	S4 = 4'b0100,
	S5 = 4'b0101,
	S6 = 4'b0110,
	S7 = 4'b0111;
	S8 = 4'b1000,
	S9 = 4'b1001,
	S10 =4'b1010,
	S11 =4'b1011,
	S12 =4'b1100,
	S13 =4'b1101,
	S14 =4'b1110,
	S15 =4'b1111,
	IDLE = 4'bx;
	
reg [3:0] state_reg;
reg [3:0] next_state;
reg load;
wire [3:0] bincount;
wire [3:0] bincount_bar;

initial begin 
		load <= 1'b1;
	end 
always @(posedge clk)begin 
		if(reset)begin
			state_reg <= IDLE;
			next_state <= S0;
			load <=1'b1;
		end
		else begin 
			load <= 1'b1;
			state_reg <= next_state;
		end

		 if (bincount == 4'b0000)begin
			state_reg <= S0;
		end
		else if (bincount == 4'b0001)begin
			state_reg <= S1;
		end
		else if (bincount == 4'b0010)begin
			state_reg <= S2;
		end
		else if (bincount == 4'b0011)begin
			state_reg <= S3;
		end
		else if (bincount == 4'b0100)begin
			state_reg <= S4;
		end
		else if (bincount == 4'b0101)begin
			state_reg <= S5;
		end	
		else if (bincount == 4'b0110)begin
			state_reg <= S6;
		end
		else if (bincount == 4'b0111)begin
			state_reg <= S7;
		end
		else if (bincount == 4'b1000)begin
			state_reg <= S8;
		end
		else if (bincount == 4'b1001)begin
			state_reg <= S9;
		end
		else if (bincount == 4'b1010)begin
			state_reg <= S10;
		end
		else if (bincount == 4'b1011)begin
			state_reg <= S11;
		end
		else if (bincount == 4'b1100)begin
			state_reg <= S12;
		end
		else if (bincount == 4'b1101)begin
			state_reg <= S13;
		end
		else if (bincount == 4'b1110)begin
			state_reg <= S14;
		end
		else if (bincount == 4'b1111) begin
			state_reg <= S15;
		end
		
			case(state_reg)  
					S0:
						begin 
							 next_state <= S1;
							 T <= 16'b1000000000000000;
						end
					S1: begin 
							 next_state <= S2;
							 T <= 16'b0100000000000000;
						end
					S2: begin 
							 next_state <= S3;
							 T <= 16'b0010000000000000;
						end
					S3: begin 
							 next_state <= S4;
							 T <= 16'b0001000000000000;
						end
					S4: begin 
							 next_state <= S5;
							 T <= 16'b0000100000000000;
						end
					S5: begin 
							 next_state <= S6;
							 T <= 16'b0000010000000000;
						end
					S6: begin 
							 next_state <= S7;
							 T <= 16'b0000001000000000;
						end
					S7: begin 
							 next_state <= S8;
							 T <= 16'b0000000100000000;
						end	
					S8: begin 
							 next_state <= S9;
							 T <= 16'b0000000010000000;
						end	
					S9: begin 
							 next_state <= S10;
							 T <= 16'b0000000001000000;
						end	
					S10: begin 
							 next_state <= S11;
							 T <= 16'b0000000000100000;
						end	
					S11: begin 
							 next_state <= S12;
							 T <= 16'b0000000000010000;
						end	
					S12: begin 
							 next_state <= S13;
							 T <= 16'b0000000000001000;
						end	
					S13: begin 
							 next_state <= S14;
							 T <= 16'b0000000000000100;
						end	
					S14: begin 
							 next_state <= S15;
							 T <= 16'b0000000000000010;
						end	
					S15: begin 
							 next_state <= S0;
							 T <= 16'b0000000000000001;
						end	
				  default:   T <= 16'b0000000000000000;	
	
			endcase	
		
	end

bin_counter binarycount(
	.q(bincount),
	.qbar(bincount_bar),
	.load(load),
	.clk(clk),
	.reset(reset));
endmodule