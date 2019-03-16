# <center> MIPS CPU </center>

## Instruction format
![](https://i.imgur.com/NzvTLWU.png)

## TestBench module
The main features are: send periodical signal CLK to CPU, set the initial value of Reg and DM, print the value of Reg and DM at each cycle, finish the program.The initial value are Reg[i]=0, DM[i]=0, (i=0~7).

## CPU module
### PC module
“PC” is the abbreviation of “Program Counter”. It is responsible for controlling next instruction ready to be executed. PC_In will assign to PC_Out in the end of every cycle.

### IM module
“IM” is the abbreviation of “Instruction Memory”. This module saves all the instructions and send the instructions to CPU according to PC.

### Reg module
“Reg” is Register module. It will read or write data according to input signals. The name of wires please refer to CPU module.

### DM module
Same as Reg, but the target here is Data Memory.</br>
Real memory is continuous spaces using byte as unit, but in order to easily implement this lab, we use what we use in Reg to simulate DM. That is using 16 bits as a unit to represent memory and use “grid” (DM[0] is a grid, DM[1] is a grid…) as continuous spaces.

### Decoder module
Decoder is the module decodes signal according to OP code that passed in. Signals are send to each module for them to know what they should do.</br>
![](https://i.imgur.com/5xJU3OB.png)

### ALU_ctrl module
Input ALU_OP and Funct and use these two input to ouput ALU_CTRL.</br>
![](https://i.imgur.com/gOK3yPF.png)


### MUX_2_to_1 module
Choose the output according to select signal.

### sign_extend module
Extend the immediate_in(14 bits) to 16bits but don’t change its sign.

### ALU module
Perform the operation according to ALU_CTRL from ALU_ctrl module.

### Add module
A normal Adder.

### Reference graph </br>
![](https://i.imgur.com/MP5fkQ0.png)
