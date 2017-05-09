#!/usr/bin/env node

const fs = require("fs");

const outputFile = "./output.txt";

if (fs.existsSync(outputFile)) {
    fs.unlinkSync(outputFile);    // delete
}

String.prototype.paddingLeft = function (paddingValue) {
   return String(paddingValue + this).slice(-paddingValue.length);
};

for (var A = 0; A <= 255; A++) {
  for (var B = 0; B <= 255; B++) {
    // example line:
    //      16'b01100100_00001010 : OUT <= 10;	//100 / 10 = 10
    var OUT;
    if(B == 0)
    {
      // divide by zero: just make OUT = 0
      OUT = 0;
    }
    else
    {
      OUT = parseInt(A/B);
    }
    fs.appendFileSync(outputFile, '    16\'b' + A.toString(2).paddingLeft('00000000') + '_' +
      B.toString(2).paddingLeft('00000000') + ' : OUT <= ' + OUT + ';  //' + A + ' / ' + B+ ' = ' + OUT + '\n');
  }
}
