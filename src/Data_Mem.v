module Data_Mem
(
    input [31:0] address;
    input [31:0] writeData;
    input Clk;
    input MemWrite, MemRead; //from the control unit
    output reg[31:0] ReadData;
)

reg [31:0] memory [0:255]; // 32 32 bit registers where the data memory is stored

//This part writes to memory
always @(posedge Clk) begin
    if (MemWrite == 1)
        memory[address] <= writeData;
    ReadData <= memory[address];
end

//This part reads from memory
always @(Address or MemRead)
   		begin	
   			if	(MemRead == 1) 
        end

endmodule