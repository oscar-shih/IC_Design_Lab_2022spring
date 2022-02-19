//IC LAB HW1

module alu (clk_p_i,
            reset_n_i,
            data_a_i,
            data_b_i,
            inst_i,
            data_o
		);

  /*========================IO declaration============================ */	  
    input           clk_p_i;
    input           reset_n_i;
    input   [7:0]   data_a_i;
    input   [7:0]   data_b_i;
    input   [2:0]   inst_i;

    output  [15:0]  data_o;

  /* =======================REG & wire================================ */
	  
    //declare reg&wire you need
	wire    [15:0]  out_inst_0;
    wire    [15:0]  out_inst_1;
    wire    [15:0]  out_inst_2;
    wire    [15:0]  out_inst_3;
    wire    [15:0]  out_inst_4;
    wire    [15:0]  out_inst_5;
    wire    [15:0]  out_inst_6;
    wire    [15:0]  out_inst_7;

    reg     [15:0]  ALU_out_inst;
    wire    [15:0]  ALU_d2_w;

    reg     [15:0]  ALU_d2_r;
      
    reg     [7:0]   reg_data_a;
    reg     [7:0]   reg_data_b;
    reg     [2:0]   reg_inst;
    wire    [15:0]  reg_subtraction;

    assign ALU_d2_w = ALU_out_inst;
    assign data_o   = ALU_d2_r;
  
    assign out_inst_0 = {8'b0 , reg_data_a[7:0]} + {8'b0 , reg_data_b[7:0]};
    assign out_inst_1 = {8'b0 , reg_data_b[7:0]} - {8'b0 , reg_data_a[7:0]};
    assign out_inst_2 = {8'b0 , reg_data_a[7:0]} * {8'b0 , reg_data_b[7:0]};
    assign out_inst_3 = {8'b0, reg_data_a[7], reg_data_a>>1};
	assign reg_subtraction  = {8'b0 , reg_data_b[7:0]} - {8'b0 , reg_data_a[7:0]};
    assign out_inst_4 = ~reg_subtraction;
	assign out_inst_5[15:8] = 8'b0;
	assign out_inst_5[ 7:0] = reg_data_a[7:0] ^ reg_data_b[7:0]; 
    assign out_inst_6[15:8] = 8'b0;
    assign out_inst_6[ 7:0] = reg_subtraction[7] ? ~reg_subtraction[7:0]+1 : reg_subtraction[7:0];

  /* ====================Combinational Part================== */
  //next-state logic

  	//todo  
			  
			  
			  
  // output logic

   	//todo
	
  /* ====================Sequential Part=================== */
    always@(posedge clk_p_i or negedge reset_n_i) begin
        if (reset_n_i == 1'b0) begin
			//todo
        end

        else begin
            //todo   
        end
    end
  /* ====================================================== */

endmodule

