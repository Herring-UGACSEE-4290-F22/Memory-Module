module In_mem(
    input clk,
    input [31:0] address,
    output reg [31:0] data_a
);     
    reg [31:0] memory[0:255];

    always @(posedge clk) begin
        data_a <= memory[address];
    end

endmodule