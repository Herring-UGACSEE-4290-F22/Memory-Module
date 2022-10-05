module Data_mem_tb();
    reg Clk_s, [31:0] Data_address_s, [31:0] Data_in_s, we_s;
    wire [31:0] Data_out_s;

    Data_mem Data_mem_test(Clk_s, Data_address_s, Data_in_s, we_s, data_out_s);

    always begin
        Clk_s <= 0;
        #10;
        Clk_s <= 1;
        #10;
    end

    integer inc;
    parameter OFFSET = 1024;
    // Testing
    initial begin
    $dumpvars(0, Data_mem_tb);
        we <= 0;
        @(posedge clk_s);
        @(posedge clk_s);
        @(posedge clk_s);
        // CASE: Write to one memory location
        @(posedge clk_s);
        #5 we <= 0;
        #5 Data_address_s <= OFFSET;
        #5 Data_in_s <= 32'hFFFFFFFF;
        @(posedge clk_s);
        #5 we <= 0;
        @(posedge clk_s);
        // CASE: Should not write anything
        @(posedge clk_s);
        #5 Data_address_s <= OFFSET + 500; // change chosen address for good measure
        #5 Data_in_s <= 32'hFFFFFFFF;
        @(posedge clk_s);
        // CASE: Rewrite to that memory
        @(posedge clk_s);
        #5 we <= 1;
        #5 Data_address_s <= OFFSET;
        #5 Data_in_s <= 32'h0000AAAA;
        @(posedge clk_s);
        #5 we <= 0;
        @(posedge clk_s);
        @(posedge clk_s);
        // CASE: Write to a block of memory in loop
        @(posedge clk_s);
        #5 we <= 1;
        #5 Data_in_s <= 32'hFFFFFFFF;
        // For loop to increment address and write to memory
        for (inc = 0; inc < 50; inc = inc + 1) begin
            # 5 Data_address_s <= OFFSET + inc;
            @(posedge clk_s);
        end
        #5 we <= 0; // end write to block
        @(posedge clk_s);
        @(posedge clk_s);
        @(posedge clk_s);
        $finish;
    end
endmodule

  // // Reg data_memory should (maybe) already have contents, pass clocks and they will be loaded into memory
        // // For loop to pass many clock edges
        // for(inc = 0; inc < 300; inc = inc + 1) begin
        //     @(posedge clk_s); // pass 300 clocks
        // end