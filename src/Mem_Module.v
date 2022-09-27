/*
Memory-Module for Class SingleCycleComputer (SCC)

TODO:
- Get the basic structure down
    - Do we need/want a mem_module and a ramchip_module??
        this would allow the SSC to access only one controller
        and the controller would direct individual memory chips
    - or we just bash all the memory into this module

- once this module IO is complete, work can begin on 
    other modules and testbenchi simult.

---TENATIVE IO---
CORE NEEDS TO SEE:
INPUTS:
clk
?? rst
address
data_in or Din?
WE or RW // write-enable //ReadWrite
input_valid //toggled when data to read is to be clocked into the module

OUTPUTS:
data_out or Dout?
busy //data is not ready to be read or written...still waiting for chip op
?? valid //to toggle when data on output is valid (a simple mem_mod could get away with just edge_clocking on the busy?)

Others (for chips?)
CS //Chip Select
OE // output enable
etc
*/

//feel free to change variable names

module Mem_Module (
    clk,
    address,
    CS, WE, OE,
    data_in,
    data_out
);


/* BY THE BOOK: SCC ISA states...
"Instruction and Address Width
	Like ARMv8, instructions have a fixed width of 32-bits, and the addressing space in memory is 32-bits."
*/
parameter address_size = 31; //fixed by ISA

parameter data_size = 63; //this is the "bit-depth"
//CLASS ISA states memory OPs store a 32bit OR 64bit, like ARMv8

parameter memory_elements = 10; //this will be used to create an array of "memory chips" ???
//if we want we can make it all in one module bc we know how much memory we need (or is supported by the ISA)
//...however, we could make a chip_module anyway and itterate them using generate and a for loop *makes for cooler and cleaner code* *and a headache if it doesn't work* ;D



input clk;
input CS, WE, OE;

input [address_size:0] address;
input [data_size:0] data_in;

output reg [data_size:0] data_out;

    
endmodule