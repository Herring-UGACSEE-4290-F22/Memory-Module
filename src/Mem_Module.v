/*
Memory-Module for Class SingleCycleComputer (SCC)

TODO:

INPUTS:
clk
address
data_in or Din
CS, WE, OE //chip-select, write-enable, output enable


OUTPUTS:
data_out or Dout

*/

//layout taken from...
//Book Appendix A: A.9 Memory Elements, page A-57

//one chip of memory
parameter address_size = ; //this holds the address bus size (how large a space do we need to address in one chip?) 31?
parameter data_size = ; //this holds the data bus size (32bits one whole instruction?) 31?

//how many chips we need
parameter memory_elements = ; //this will be used to create an array of "memory chips"

module ChipRAM (
    clk,
    address,
    CS, WE, OE,
    data_in,
    data_out
);

input clk;
input CS, WE, OE;

input [address_size:0] address;
input [data_size] data_in;

    
endmodule