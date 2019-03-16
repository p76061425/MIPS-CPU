`timescale 1ns / 1ps

module ALU_ctrl(Funct, ALU_OP, ALU_Ctrl_Out);

    input [5:0] Funct;
    input [1:0] ALU_OP;
    output reg [3:0] ALU_Ctrl_Out;
	
	////  ALUOP  ////   ////  Function  ////
	//  R-type 10  //   //   add 100000   //
	//  beq    01  //   //   sub 100010   //
	//  else   00  //   //   slt 101010   //
	/////////////////   ////////////////////
	
	///  ALUOP  Function  ALU_Ctrl  ///
	//    10     000000     0000     //
	//    10     100000     0010     //
	//    10     100010     0110     //
	//    10     101010     0111     //
	//    01     XXXXXX     0110     //
	//    00     XXXXXX     0010     //
	///////////////////////////////////
	
	//assign ALU_Ctrl_Out[3] = ;
	//assign ALU_Ctrl_Out[2] = ;
	//assign ALU_Ctrl_Out[1] = ;
	//assign ALU_Ctrl_Out[0] = ;
	
    
    always@(*)begin
        if(ALU_OP == 2'b10)begin
            if(Funct == 6'b0)begin
                ALU_Ctrl_Out = 4'b0;
            end
            else if(Funct == 6'b100000)begin
                ALU_Ctrl_Out = 4'b0010;
            end
            else if(Funct == 6'b100010) begin
                ALU_Ctrl_Out = 4'b0110;
            end
            else if(Funct == 6'b101010)begin
                ALU_Ctrl_Out = 4'b0111;
            end
        end
        else if(ALU_OP == 2'b01)begin
            ALU_Ctrl_Out = 4'b0110;
        end
        else if(ALU_OP == 2'b00)begin
            ALU_Ctrl_Out = 4'b0010;
        end
        else begin
            ALU_Ctrl_Out = 4'b0;
        end
    end
    
    
    
    
endmodule
