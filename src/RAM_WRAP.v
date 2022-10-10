module RAM(
    input Clk,
    input [31:0] instr_address,
    output reg [31:0] instr_out,
    input instr_en,
    input [31:0] data_addr, 
    input [31:0] data_input,
    output reg [31:0] data_output,
    input data_we
);

In_mem Instructions(Clk, instr_en, instr_address, instr_out);
Data_mem Data_Memory_Mod(Clk, data_addr, data_input, data_we, data_output);


endmodule