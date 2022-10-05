module Data_mem(
    input clk,
    input [31:0] data_address,
    input [31:0] data_in,
    input write_e,
    output reg [31:0] data_out
);


// Data memory block (1024*4) bytes of space
reg [31:0] data_memory [0:1024];

// Load data_memory with contents of file (assuming file is in hex)
initial begin
    $readmemh("FILENAME.???", data_memory);
end

always

endmodule