
parameter NODE_ADDRESS_SIZE = 4;
parameter ARRAY_LENGTH = 1 << (NODE_ADDRESS_SIZE);

typedef struct {
  reg valid;
  reg [NODE_ADDRESS_SIZE-1:0] associated_class;
  reg [3:0] Mi;
  reg [7:0] weight;
  reg [NODE_ADDRESS_SIZE-1:0] response_classes[0:NODE_ADDRESS_SIZE-1];
  } associativeElement;

module associative_memory (input RESET);

associativeElement elements [ARRAY_LENGTH-1:0];

integer i;
always_ff @(posedge RESET)
begin
  for (i=0; i<ARRAY_LENGTH; i=i+1) elements[i].valid <= 1'b0;
end

endmodule
