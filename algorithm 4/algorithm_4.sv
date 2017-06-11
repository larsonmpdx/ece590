`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////
package states  ;

    typedef enum logic [2:0] {S0,S1} states_t;        //Defining state for FSM

    parameter NODE_ADDRESS_SIZE = 4;
    parameter VECTOR_LENGTH = 144;      // 12*12 vector
    parameter VECTOR_ELEMENT_SIZE = 8;  // 8 bits each
    parameter THRESHOLD_SIZE = 20;

    typedef struct  	                                         //memory layer
        {
            logic valid;                                                // bit for checking validity
            logic [NODE_ADDRESS_SIZE-1:0] class_name                    // class name
            logic [VECTOR_LENGTH-1:0] W [0:VECTOR_ELEMENT_SIZE-1];      // weight vector
            logic [THRESHOLD_SIZE-1:0] T;                               // similarity threshold
            } MemoryLayer_t;
endpackage

module algo_2( input logic resetH, new_ip, clk,                       // signals
               input [VECTOR_LENGTH-1:0] x [0:VECTOR_ELEMENT_SIZE-1], // key vector
               output logic [NODE_ADDRESS_SIZE-1:0] found_class,
               output match_found,
               output finished
    );

    import states::*;

    parameter MEMORY_LAYER_SIZE = 10;
    MemoryLayer_t memory[MEMORY_LAYER_SIZE-1:0];                  // dynamic memory array of type MemoryLayer_t

    // after each node is processed, these elements are filled if the g found is higher than the previous value
    logic [THRESHOLD_SIZE-1:0] highest_g_found;
    logic [THRESHOLD_SIZE-1:0] current_g;
    logic [THRESHOLD_SIZE-1:0] x_magnitude;
    MemoryLayer_t best_match_found;

    // inputs
    logic wr_en= 0, cs=0;

    // outputs
    logic finished=0;
    logic match_found;
    logic [NODE_ADDRESS_SIZE-1:0] found_class;

    // importing all the contents of package

    states_t state, next_state;             // defining variables of type states_t

     // always block for switching of states
    always_ff @(posedge clk) begin

        if (resetH) begin
            state <= S0;              // reset to initial state
            for (int i=0; i<MEMORY_LAYER_SIZE; i=i+1) begin
                memory[i].valid <= 1'b0;
                memory[i].class_name <= 'b0;
                memory[i].T <='b0;
            end

            for(int i=0; i<MEMORY_LAYER_SIZE; i=i+1) begin
                for(int j=0; j<=VECTOR_LENGTH-1; j=j+1) begin
                    memory[i].W[j] <='b0;
                end
            end

            current_g=0;
            best_match_found = memory[0];   //copy first memory element (shortcut to reset to 0)

        end
        else
            state <= next_state;        // transition to next state

    end

    // always block to define next states
     always_comb begin: set_next_state

        unique case (state)

        S0: begin
                cs= 1;
                wr_en = 0;
                rd_en = 1;
                if (new_ip) next_state = S1;

                  // todo: run this using a clock in the style of algorithm 1
                  current_g = 0;
                  current_bias = 0;
                  for (int i=0; i<MEMORY_LAYER_SIZE; i=i+1) begin
                      for (int j=0; j<VECTOR_LENGTH; j=i+1) begin
                          current_g = current_g + memory[i].W[j] * x[j];    // todo: use 8-bit multiplier (might not exist as memristor component).  todo: use 20-bit adder
                          current_bias = current_bias + memory[i].W[j] ^ 2; // todo: use 8-bit square LUT.  todo: use 20-bit adder
                      end

                      // after calculating the running total of g and bias, add together, along with (1/2) multiplication of bias
                      current_g = current_g - current_bias >> 1;

                      if(current_g > highest_g_found) begin    // todo: use a memristor comparator
                          highest_g_found = current_g;
                          best_match_found = memory[i];
                      end
                  end

                else next_state = S0;
                $display("You are in state S0");
            end

        S1: begin

              // see if the best match is a good enough match
              if(highest_g_found > 0) begin

                  // todo: run this using a clock in the style of algorithm 1
                  x_magnitude = 0;
                  for (int j=0; j<VECTOR_LENGTH; j=i+1) begin
                      x_magnitude = x_magnitude + x[j] ^ 2;    // todo: use 8-bit square LUT.  todo: use 20-bit adder
                  end

                  if((x_magitude - (highest_g_found << 1)) > best_match_found.T) begin    // todo: use a memristor comparator
                      found_class = best_match_found.class_name;
                      match_found = 1;
                  end

                  finished = 1;
              else
                  match_found = 0;
                  finished = 1;
              end


              next_state = S0;
              $display("You are in state S1");
            end
        endcase
    end

endmodule
