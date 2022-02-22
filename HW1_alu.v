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

    reg   	[15:0]  ALU_d2_w; 
    reg     [15:0]  ALU_d2_r; 
      
    reg     [7:0]   reg_data_a;
    reg     [7:0]   reg_data_b;

    assign data_o   = ALU_d2_r;
  
    assign out_inst_0 = {8'b0 , reg_data_a[7:0]} + {8'b0 , reg_data_b[7:0]};
    assign out_inst_1 = $signed({1'b0 , reg_data_b[7:0]}) - $signed({1'b0 , reg_data_a[7:0]});
    assign out_inst_2 = {8'b0 , reg_data_a[7:0]} * {8'b0 , reg_data_b[7:0]};
    assign out_inst_3 = {9'b0, reg_data_a[7:1]};
    assign out_inst_4 = ~out_inst_1;
	assign out_inst_5 = {8'b0,reg_data_a[7:0]} ^ {8'b0, reg_data_b[7:0]}; 
    assign out_inst_6 = out_inst_1[15] ? ~out_inst_1+1 : out_inst_1;

  /* ====================Combinational Part================== */
  //next-state logic
	reg [2:0] cur_state; 
	reg [2:0] next_state; 
	
	always @(*) begin
		case(cur_state)
			3'b000: begin
				if (inst_i == 3'b111) begin
					next_state = cur_state;
				end
				else begin
					next_state = inst_i;
				end
			end

			3'b001: begin
				if (inst_i == 3'b111) begin
					next_state = cur_state;
				end
				else begin
					next_state = inst_i;
				end
			end

			3'b010: begin
				if (inst_i == 3'b000 || inst_i == 3'b001 || inst_i == 3'b011 || inst_i == 3'b101) begin
					next_state = inst_i;
				end
				else begin
					next_state = cur_state;
				end
			end

			3'b011: begin
				if (inst_i == 3'b000 || inst_i == 3'b001 || inst_i == 3'b110) begin
					next_state = inst_i;
				end
				else begin
					next_state = cur_state;
				end
			end

			3'b100: begin
				if ( inst_i == 3'b001 || inst_i == 3'b101) begin
					next_state = inst_i;
				end
				else begin
					next_state = cur_state;
				end
			end

			3'b101: begin
				if (inst_i == 3'b000 || inst_i == 3'b001 || inst_i == 3'b010) begin
					next_state = inst_i;
				end
				else begin
					next_state = cur_state;
				end
			end

			3'b110: begin
				if (inst_i == 3'b001 || inst_i == 3'b101) begin
					next_state = inst_i;
				end
				else begin
					next_state = cur_state;
				end
			end
			default: 
				next_state = cur_state;
		endcase
	end
  	//todo  
			  
			  
			  
  // output logic
	always @(*) begin
		case(cur_state)
			3'b000: begin
				ALU_d2_w = out_inst_0;
			end

			3'b001: begin
				ALU_d2_w = out_inst_1;
			end

			3'b010: begin
				ALU_d2_w = out_inst_2;
			end

			3'b011: begin
				ALU_d2_w = out_inst_3;
			end

			3'b100: begin
				ALU_d2_w = out_inst_4;
			end

			3'b101: begin
				ALU_d2_w = out_inst_5;
			end

			3'b110: begin
				ALU_d2_w = out_inst_6;
			end

			default: begin
				ALU_d2_w = ALU_d2_r;
			end
		endcase
	end
   	//todo
	
  /* ====================Sequential Part=================== */
    always@(posedge clk_p_i or negedge reset_n_i) begin
        if (reset_n_i == 1'b0) begin
			//todo
			ALU_d2_r   <= 16'b0;
			cur_state  <= 3'b0;
			reg_data_a <= 8'b0;
			reg_data_b <= 8'b0;
        end

        else begin
            //todo   
			ALU_d2_r   <= ALU_d2_w;
			cur_state  <= next_state;
			reg_data_a <= data_a_i;
			reg_data_b <= data_b_i;
        end
    end
  /* ====================================================== */

endmodule