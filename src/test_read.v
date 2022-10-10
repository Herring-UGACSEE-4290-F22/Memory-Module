//lecture 8 slide 13

module test_read;
	
integer handler; // file handler
integer scanner; // file handler

integer read_data; //holds binary input from file

initial begin
    handler = $fopen("test_read.asm", "rb");
    if (handler == 0) begin //handler is not NULL
        $display("404 File Not Found...");
        $finish;
    end
    $display("File Loaded");
end

always @(* ) begin
    $display("itter");
    handler = $fscanf(handler, "%h", read_data); 
    //if (!$feof(read_data)) begin
        $display("%h", read_data);
    //end
end

endmodule
//always @(posedge clk) begin

    /*             
        while (! $feof(file)) begin //reads file till EOF
            read = $fscanf(file, "%d\n", read_instruction);
            //$fgets(read_instruction, file); //returns file by line
            $display("%0s", read_instruction);
        end
    end
    //$fclose(file);// Close the file
    */
