/*
Memory-Module for Class SingleCycleComputer (SCC)

TODO:
- Get the basic structure down
- Do we want to break this up into two modules still?
    
- once this module IO is complete, work can begin on 
    other modules (if needed) and testbenchi simult.

feel free to change variable names
*/
module Mem_Module (
    clk,
    //do we need a reset??? To be taken in from a global wire (not passed from the cpu core) ie "nreset" ???

    i_mem_a,            //instruction mem addressing
    i_mem_v,            //instruction mem (read only)
    i_mem_en,           //instruction control

    d_mem_a,            //data mem addressing
    d_mem_out_v, d_mem_in_v //data mem IO busses
    d_mem_write, d_mem_read //data mem control
);


/* BY THE BOOK: SCC ISA states...
"Instruction and Address Width
	Like ARMv8, instructions have a fixed width of 32-bits, and the addressing space in memory is 32-bits."
*/
parameter INSTRUCTION_ADDRESS_SIZE = 31; //fixed by ISA
parameter INSTRUCTION_SIZE = 31; //instruction bit depth

parameter DATA_ADDRESS_SIZE = 31; //fixed by ISA
parameter DATA_SIZE = 31; //data bit-depth

	input clk,
	input rst,

    //to read Instructions
	input       [31:0] i_mem_a,         // Instruction memory address
    output reg  [31:0] i_mem_v,         // Instruction memory value
    input       i_mem_en,               // Instruction memory read enable

    //adressing data
    input   [31:0] d_mem_a,             // Data memory address
    
    //to read Data
    input   d_mem_read,                 //indicate data read
    output reg  [31:0] d_mem_out_v,     // Data memory write value
 
    //to write Data
	input   d_mem_write,                // indicate data write
    input   d_mem_in_v,                 // data memory write value

    
endmodule