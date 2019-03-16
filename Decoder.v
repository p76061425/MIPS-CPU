`timescale 1ns / 1ps

module Decoder(OP, Reg_Dst, Jump, Branch, Mem_Read, Mem_to_Reg, ALU_OP, Mem_Write, ALU_Src, Reg_Write);

	input [5:0] OP;
	output wire Reg_Dst, Jump, Branch, Mem_Read, Mem_to_Reg, Mem_Write, ALU_Src, Reg_Write;
	output wire [1:0] ALU_OP;
	
	/////  OP Code  /////
	//  R-type 000000  //
	//  load   100011  //
	//  store  101011  //
	//  beq    000100  //
	//  addi   001000  //
	//  j      000010  //
	/////////////////////
	
    parameter
    R_type = 6'b000000,
    load   = 6'b100011,
    store  = 6'b101011,
    beq    = 6'b000100,
    addi   = 6'b001000,
    jump   = 6'b000010;
    
    
	assign Reg_Dst = (OP == 6'b000000) ? 1 : 0;
	assign Mem_Read = (OP == 6'b100011) ? 1 : 0;
	assign Mem_to_Reg = (OP == 6'b100011) ? 1 : 0;
	assign Mem_Write = (OP == 6'b101011) ? 1 : 0;
	
	////  ALUOP  ////
	//  R-type 10  //
	//  beq    01  //
	//  else   00  //
	/////////////////
	
	assign ALU_Src = (OP==load  || // load
                      OP==store || // store
                      OP==addi  || // addi
                      OP==jump)   // j
                      ? 1 : 0;
                      
	assign Reg_Write = (OP==R_type ||
                        OP==load   ||
                        OP==addi )
                        ? 1 : 0;
                        
	assign Jump = (OP==jump) 
                   ? 1 : 0;
                   
	assign Branch = (OP==beq)
                    ? 1 : 0;
	assign ALU_OP = (OP==R_type) ? 2'b10 :
                    (OP==beq)    ? 2'b01 : 2'b0;
                    
                    
    
endmodule


