module Data_mem(
    input clk,
    input [31:0] data_address,
    input [31:0] data_in,
    input we,
    output reg [31:0] data_out
);


// Data memory block (1024*4) bytes of space or just 1024 DWORDS lmao
parameter OFFSET = 256; 
reg [31:0] data_memory [OFFSET:1023+OFFSET];

// Load data_memory with contents of file (assuming file is in hex)
initial begin
    $readmemh("data.mem", data_memory);
end

// read/write synchronous block
always @(posedge clk) begin
    if(we) 
        data_memory[data_address] <= data_in;
    data_out <= data_memory[data_address];
end


endmodule