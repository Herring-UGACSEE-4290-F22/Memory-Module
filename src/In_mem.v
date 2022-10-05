module In_mem(
    input clk,
    input [31:0] address,
    output reg [31:0] data_a
);     
    reg [31:0] memory[0:255];

    initial begin
        $readmemh("FILENAME.mem", memory);
    end

    always @(posedge clk) begin
        data_a <= memory[address];
    end

endmodule