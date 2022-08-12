`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_Phase_accumulator;
	reg clk, rst;
	reg [31:0] Phase_accumulator_in;
	reg Phase_accumulator_write_enable_in;
	wire [31:0] Phase_accumulator_out;
	
	Phase_accumulator u6(.clk(clk), .rst(rst),
	.Phase_accumulator_in(Phase_accumulator_in),
	.Phase_accumulator_write_enable_in(Phase_accumulator_write_enable_in),
	.Phase_accumulator_out(Phase_accumulator_out)
	);
	
	always #(1) clk = ~clk;
	always #(2) begin rst = 0; Phase_accumulator_write_enable_in = 1; Phase_accumulator_in = 1; end//계속 더해짐
	
	initial begin
		 clk = 1; rst = 1; Phase_accumulator_write_enable_in=0; Phase_accumulator_in=0; //초기 신호 초기화
		#1 rst = 0;

		// Phase_accumulator_write_enable_in = 0; Phase_accumulator_in = 1; //write enable 끔
		#30	 $finish;
	end
	
endmodule
