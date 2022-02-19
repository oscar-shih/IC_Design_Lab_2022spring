`timescale 1ns/10ps
`define CYCLE    10           	         // Modify your clock period here
//`define SDFFILE  "./alu.sdf"	         // Modify your sdf file name
`define IMAGE1     "./data1.dat"         // Modify your test image file
`define IMAGE2     "./data2.dat"         // Modify your test image file
`define CMD        "./cmd.dat"           // Modify your test cmd file
`define EXPECT     "./out_golden.dat"    // Modify your output golden file

module ALU_test;

parameter DATA_LENGTH   = 80;
parameter OUT_LENGTH    = 82;

reg           clk;
reg           reset;
reg   [7:0]   datain1,datain2;
reg   [2:0]   cmd;
wire  [15:0]  dataout;

reg   [2:0]   cmd_mem   [0:DATA_LENGTH-1];
reg   [15:0]  out_mem   [0:OUT_LENGTH-1];
reg   [7:0]   image1_mem  [0:DATA_LENGTH-1];
reg   [7:0]   image2_mem  [0:DATA_LENGTH-1];
reg   [15:0]  out_temp;

reg           stop;
integer       i, out_f, err, pattern_num;
reg           over;

   alu alu_0( .clk_p_i(clk), .reset_n_i(reset), .data_a_i(datain1), .data_b_i(datain2), .inst_i(cmd), .data_o(dataout) );          
   
//initial $sdf_annotate(`SDFFILE, top);
initial	$readmemh (`IMAGE1,  image1_mem);
initial	$readmemh (`IMAGE2,  image2_mem);
initial	$readmemh (`CMD,    cmd_mem);
initial	$readmemh (`EXPECT, out_mem);

initial begin
   clk         = 1'b1;
   reset       = 1'b1;
   stop        = 1'b0;  
   over        = 1'b0;
   pattern_num = 0;
   err         = 0;
   i           = 0;   
    #2.5 reset=1'b0;                            // system reset
    #2.5 reset=1'b1;

end

always begin #(`CYCLE/2) clk = ~clk; end

initial begin
	$dumpfile("alu.fsdb");
	$dumpvars;

   out_f = $fopen("out.dat");
   if (out_f == 0) begin
        $display("Output file open error !");
        $finish;
   end
end


always @(negedge clk)begin
    if (i < OUT_LENGTH) begin
		 if(i < DATA_LENGTH)begin
          cmd      = cmd_mem[i];
          datain1  = image1_mem[i];
	       datain2  = image2_mem[i];
	    end
		 out_temp = out_mem[i];
	    i = i+1;      
    end
    else                                       
       stop = 1 ;      
end

always @(posedge clk)begin
    
    if(dataout !== out_temp && out_temp!==16'h0000) begin
        $display("ERROR at %d:output %h !=expect %h ",pattern_num-2, dataout, out_temp);
	    $fdisplay(out_f,"ERROR at %d:output %h !=expect %h ",pattern_num-2, dataout, out_temp);
        err = err + 1 ;
    end
    pattern_num = pattern_num + 1; 
    if(pattern_num === OUT_LENGTH)  over = 1'b1;
end

initial begin
      @(posedge stop)      
      if(over) begin
         $display("---------------------------------------------\n");
         if (err == 0)  begin
            $display("All data have been generated successfully!\n");
			$display("You will get 80 score in this RTL!\n");
            $display("-------------------PASS-------------------\n");
         end
         else begin
            $display("There are %d errors!\n", err);
			$display("You will get %d score in this RTL!\n", 80-err);
		 end
            $display("---------------------------------------------\n");
      end
      else begin
        $display("---------------------------------------------\n");
        $display("Error!!! There is no any data output ...!\n");
        $display("-------------------FAIL-------------------\n");
        $display("---------------------------------------------\n");
      end
      $finish;
end
   
endmodule









