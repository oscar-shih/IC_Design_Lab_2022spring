`timescale 1ns/1ps

module alu_tb;

    // input
    reg clk_p_i = 0;
    reg rst_n_i = 1;
    reg [7:0] data_a_i = 8'd0;
    reg [7:0] data_b_i = 8'd0;
    reg [2:0] inst_i = 3'b0;

    // output
    wire [15:0] data_o; 

    alu ALU(
        clk_p_i,
        rst_n_i,
        data_a_i [7:0],
        data_b_i [7:0],
        inst_i   [2:0],
        data_o   [15:0]
    );

    initial begin
        forever begin
            #5 clk_p_i = ~clk_p_i;
        end
    end

    initial begin
        #1 rst_n_i = 0;
        #5 rst_n_i = 1;
    end

    initial begin
        $fsdbDumpfile("wave.fsdb");
        $fsdbDumpvars;
    end

    initial begin
                {data_a_i, data_b_i, inst_i} = {8'd0, 8'd0, 3'b0};
        #10     {data_a_i, data_b_i, inst_i} = {8'd25, 8'd35, 3'b11};
        #10     {data_a_i, data_b_i, inst_i} = {8'd37, 8'd128, 3'b100};
        #10     {data_a_i, data_b_i, inst_i} = {8'd50, 8'd60, 3'b110};
        #10     {data_a_i, data_b_i, inst_i} = {8'd65, 8'd100, 3'b110};
        #5      {data_a_i, data_b_i, inst_i} = {8'd65, 8'd100, 3'b111};
        #5      $finish;
    end

endmodule