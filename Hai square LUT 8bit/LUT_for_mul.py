''' Convert a decimal into binary
  
    bit0 = int(value%2)
    bit1 = int(value/2 %2)    
    bit2 = int(value/4 %2)        
    bit3 = int(value/8 %2) 
    bit4 = int(value/16 %2)        
    bit5 = int(value/32 %2)     
    bit6 = int(value/64 %2)        
    bit7 = int(value/128 %2)

    Example: value = 5
    -   bit 0 = 5 % 2 = 1                        --> convert to int = 1
    -   bit 1 = (5/2) % 2    = 2.5 % 2   = 0.5   --> convert to int = 0
    -   bit 2 = (5/4) % 2    = 1.25 % 2  = 1.25  --> convert to int = 1
    -   bit 3 = (5/8) % 2    = 0.63 % 2  = 0.63  --> convert to int = 0
    -   bit 4 = (5/16) % 2   = 0.31 % 2  = 0.31  --> convert to int = 0
    -   bit 5 = (5/32) % 2   = 0.17 % 2  = 0.17  --> convert to int = 0
    -   bit 6 = (5/64) % 2   = 0.08 % 2  = 0.08  --> convert to int = 0
    -   bit 7 = (5/128) % 2  = 0.04 % 2  = 0.04  --> convert to int = 0
    
    result = 0000_0101 = 5
'''


def bin_convert(num):
    binary = ''                                     # binary value -- string type
    bit = []                                        # list storing binary bits
    power_of_2 = 1                                  # value for dividing

    for i in range (0, 8):
        single_bit = int((num/power_of_2)%2)        # calculating single bit
        bit.append(single_bit)                      # update list of binary bits
        power_of_2 = power_of_2 * 2                 # update value for the next dividing

    for j in range (7, -1, -1):                     # Get each bit in the list
        binary = binary + str(bit[j])               # Create a string representing binary value

    return binary


def LUT_generate():
    data_file = open("LUT_multiplication.txt", 'w+')                                # Create and open a txt file
    max_value = 256

    for upper_8_bit in range (0, max_value):
        upper_binary_value = bin_convert(upper_8_bit)                               # Get the upper 8 binary
        #for lower_8_bit in range (0, max_value):
        #lower_binary_value = bin_convert(lower_8_bit)                           # Get the lower 8 binary
        result = upper_8_bit * upper_8_bit                                      # Calculate the multiplication
        # generating a string to write into the txt file
        line = "16'b" + upper_binary_value + "_" + upper_binary_value + " : " + "OUT <= " + str(result) + \
                "; //" + str(upper_8_bit) + " * " + str(upper_8_bit) + " = " + str(result) +"\n"

        print (line)

        data_file.write(line)                                                   # Write into the text file

    data_file.close()
    return

LUT_generate()