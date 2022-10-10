//lecture 8 slide 13

module test_read;
	
integer handler; // file handler
integer scanner; // file handler

reg [32:0] read_data; //holds binary input from file

initial begin
    handler = $fopen("test_read.asm", "rb");
    if (handler == 0) begin //handler is not NULL
        $display("404 File Not Found...");
        $finish;
    end
    $display("File Loaded");
end
/*
always begin
	CLK <= 0;
	#10;
	CLK <= 1;
	#10;
end
*/
always @(* ) begin
//always begin
    $display("itter");
    scanner = $fscanf(handler, "%h", read_data);
    if (!$feof(read_data)) begin
        $display("%h", read_data);
    end
    #10;
end

endmodule
