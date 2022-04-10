module alu(
             clk_p_i,
             reset_n_i,
             data_a_i,
             data_b_i,
             inst_i,
             data_o
             );
  /* ======================parameter definition====================== */
  
	  parameter		  ADD	=	3'b000;
	  parameter		  SUB	=	3'b001;
	  parameter		  MUL	=	3'b010;
	  parameter		  DIV	=	3'b011;
	  parameter		  NOT	=	3'b100;
	  parameter		  XOR	=	3'b101;
	  parameter		  ABS	=	3'b110;
	  parameter		  PRE	=	3'b111;
  /*========================IO declaration============================ */	  
      input           clk_p_i;
      input           reset_n_i;
      input   [7:0]   data_a_i;
      input   [7:0]   data_b_i;
      input   [2:0]   inst_i;

      output  [15:0]  data_o;

  /* ============================================ */
      wire    [15:0]   out_inst_0;
      wire    [15:0]   out_inst_1;
      wire    [15:0]   out_inst_2;
      wire    [15:0]   out_inst_3;
      wire    [15:0]   out_inst_4;
      wire    [15:0]   out_inst_5;
      wire    [15:0]   out_inst_6;
      wire    [15:0]   out_inst_7;

      reg     [15:0]   ALU_out_inst;
      wire    [15:0]   ALU_d2_w;

      reg     [15:0]   ALU_d2_r;

      reg     [7:0]    ALU_in_1;
      reg     [7:0]    ALU_in_2;
	  
	  reg     [2:0]	   next_state;
	  reg     [2:0]    state;
	  
  assign ALU_d2_w   = ALU_out_inst;
  assign data_o     = ALU_d2_r;

  /* ====================Combinational Part================== */
  assign out_inst_0 = {8'd0,ALU_in_1[7:0]} + {8'd0,ALU_in_2[7:0]};
  assign out_inst_1 = ALU_in_2 - ALU_in_1;
  assign out_inst_2 = ALU_in_1 * ALU_in_2;
  assign out_inst_3 = (ALU_in_1[7]==1'b0)?{9'd0,ALU_in_1[7:1]}:{9'b111111111,ALU_in_1[7:1]};
  assign out_inst_4 = ~out_inst_1;
  assign out_inst_5 = {8'd0,ALU_in_1}^{8'd0,ALU_in_2};
  assign out_inst_6 = (out_inst_1[15]==1'b0)?out_inst_1:(~out_inst_1+16'd1);
  assign out_inst_7 = 8'd0;
  
  //next-state logic
    always@( * )
	begin
		case(state)
			3'b000: begin
                  if(inst_i==3'b111)
                     next_state = 3'b000;
                  else
                     next_state = inst_i;
                 end
			3'b001: begin
			         if(inst_i==3'b111)
			            next_state = 3'b001;
			         else
			            next_state = inst_i;
			        end
			3'b010: begin
						if(inst_i==3'b000 | inst_i==3'b001 | inst_i==3'b011 | inst_i==3'b101)
							 next_state = inst_i;
					   else if(inst_i==3'b111)
					       next_state = 3'b010;
						else
						    next_state = state;
					end
			3'b011: begin
						if(inst_i==3'b000 | inst_i==3'b001 | inst_i==3'b110)
							next_state = inst_i;
						else if(inst_i==3'b111)
					       next_state = 3'b011;
						else
						    next_state = state;
					end
			3'b100: begin
						if(inst_i==3'b001 | inst_i==3'b101)
							next_state = inst_i;
						else if(inst_i==3'b111)
					      next_state = 3'b100;
						else
						   next_state = state;
					end
			3'b101: begin
						if(inst_i==3'b000 | inst_i==3'b001 | inst_i==3'b010)
							next_state = inst_i;
						else if(inst_i==3'b111)
					       next_state = 3'b101;
						else
						    next_state = state;
					end
			3'b110: begin
						if(inst_i==3'b001 | inst_i==3'b101)
							next_state = inst_i;
						else
						    next_state = state;
					end
			3'b111: next_state = state;
			default:next_state = inst_i;
		endcase
	end
  

  
  // output logic
    always@ ( * )
    begin
        case(state)
           3'b000:    ALU_out_inst = out_inst_0;
           3'b001:    ALU_out_inst = out_inst_1;
           3'b010:    ALU_out_inst = out_inst_2;
           3'b011:    ALU_out_inst = out_inst_3;
           3'b100:    ALU_out_inst = out_inst_4;
           3'b101:    ALU_out_inst = out_inst_5;
           3'b110:    ALU_out_inst = out_inst_6;
           3'b111:    ALU_out_inst = out_inst_7;
           default:   ALU_out_inst = out_inst_0;
        endcase
    end

  /* ====================Sequential Part=================== */
    always@(posedge clk_p_i or negedge reset_n_i)
    begin
        if (reset_n_i == 1'b0)
        begin
			  ALU_in_1 		<= 8'd0;
              ALU_in_2 		<= 8'd0;
              //inst_i 	<= 3'd0;
              ALU_d2_r 		<= 16'd0;
			  state			<= 3'd0;
        end
        else
        begin
              ALU_d2_r 		<= ALU_d2_w;
			     ALU_in_1 		<= data_a_i;
              ALU_in_2 		<= data_b_i;
              //inst_i 	<= inst_i;
			  state    		<= next_state;  
        end
    end
  /* ====================================================== */

endmodule

