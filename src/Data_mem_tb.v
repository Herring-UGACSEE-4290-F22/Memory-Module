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
    // Testing
    initial begin
    $dumpvars(0, Data_mem_tb);
        we <= 0;
        @(posedge clk_s);
        @(posedge clk_s);
        @(posedge clk_s);
        // Write enable on
        #5 we <= 1;
        // Reg data_memory should (maybe) already have contents, pass clocks and they will be loaded into memory
        // For loop to pass many clock edges
        for(inc = 0; inc < 300; inc = inc + 1) begin
            @(posedge clk_s); // pass 300 clocks
        end
        $finish;
    end
endmodule