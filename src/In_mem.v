//This is a module of ROM

//the bit depth is 32 bits
//total adderssable space is 32bit
//this module implaments only INSTRUCTION_ADDRESS_SIZE amount of memory

parameter INSTRUCTION_ADDRESS_SIZE = 255; //total memory allocated of the 2^32 bits available to address

module In_mem(
    input clk,
    input [31:0] address,
    input enable,
    output reg [31:0] data_a
);     
    reg [31:0] memory[0:INSTRUCTION_ADDRESS_SIZE];

    always @(posedge clk) begin
        if (enable == 1) begin
            data_a <= memory[address];
        end
    end

endmodule