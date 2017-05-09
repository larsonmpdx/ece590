creates output.txt with a verilog LUT for an 8/8 divider.  requires the top and bottom of the file be added to make sense, something like:

```
module divider_8x8(CLK, A, B, OUT);
input wire CLK;
input wire [7:0] A;
input wire [7:0] B;
output reg [7:0] OUT;

always @(posedge CLK)
case ({A, B})

...

endcase
endmodule
```

to run:
* install node and npm
* run `npm install` in this dir
* run `node ./index.js`
