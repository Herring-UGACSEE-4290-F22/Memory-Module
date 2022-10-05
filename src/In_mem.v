module In_mem(
    input clk,
    input [31:0] address,
    output reg [31:0] instr_out
);     
    reg [31:0] in_memory[0:255];

    // Load in_memory block with values of mem file
    initial begin
        $readmemh("FILENAME.mem", in_memory);
    end


    // Fetch instruction at in address and put it into instr_out
    always @(posedge clk) begin
        instr_out <= in_memory[address];
    end

endmodule