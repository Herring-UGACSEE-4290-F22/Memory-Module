//read only just needs to read the intruction

module Instruction_Mem 
(
    input [31:0] address;
    output [31:0] instruction;
)

reg [31:0] memory [0:31]; // 32 32 bit registers where the instruction memory is stored

//have to assign instructions from the address
//initilizing memory from file
//$readmemb("<file_name>", <memory_name>);





endmodule