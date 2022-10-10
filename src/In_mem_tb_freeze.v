//Testbench for Instruction memory
/*
This module calls In_mem.v
In_mem should load a file into memory
this module will then emulate a PC
    to dump the contents into a log or file or waveform
    */

`timescale 10ms/1ms

module Im_mem_testbench();

//declare outside reg/wires
reg clk;
reg e;
reg [31:0] address;
wire [31:0] instr_out;


In_mem  UnderTest (
    clk,
    e, //enable places data on the output
    address, //desired address to output
    instr_out //the content instruction stored in the given adress
);

//Clock
always begin
	clk <= 0;
	#10;
	clk <= 1;
	#10;
end

initial begin
$dumpvars(0,Im_mem_testbench);

	//wait one cycle to show startup state
	@(posedge clk);

    // First Tick (TICK)
	@(negedge clk);
    e <= 1'b0;
    address <= 32'h00;

    @(posedge clk); //TOCK
    //nothing should be on instr_out here

    @(negedge clk);
    e <= 1'b1;
    address <= 32'h00; //address 0

    @(posedge clk); //TOCK
    //first instruction should output
    
#10 $finish;
end
endmodule