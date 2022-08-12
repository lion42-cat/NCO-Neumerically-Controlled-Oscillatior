`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Phase_accumulator(clk, rst, Phase_accumulator_in, Phase_accumulator_write_enable_in, Phase_accumulator_out);
	input clk, rst;
	input [31:0] Phase_accumulator_in;
	input Phase_accumulator_write_enable_in; 
	output [31:0] Phase_accumulator_out; //go to Quantizer

	wire[31:0] Phase_accumulator_init;
	wire Phase_accumulator_write_enable;
		
	reg [31:0] added_data = 0;
	wire [31:0] answer;
	reg [31:0] answer_saved;
	
	parameter countNUM = 5; //counter 갯수
	reg [31:0] d_1clk = 0;
	reg [31:0] d_2clk = 0;
	reg [31:0] d_3clk = 0;
	reg [31:0] d_4clk = 0;
	
	reg [2:0] count;
	
	//in
	dff PA_d(Phase_accumulator_in, clk, rst, Phase_accumulator_init);
	dff_1bit PA_e(Phase_accumulator_write_enable_in, clk, rst, Phase_accumulator_write_enable);
	
	//calculate
	/*
	//counter 0,1,2,3,4 반복
	always @ (posedge clk or posedge rst) begin
		if (rst)
			begin
				count <= 3'b000;
			end
		else if(count < countNUM)
			begin
				count <= count + 3'b001;
			end
		else
			count <= 1;
	end
	
	//adder의 input1 설정
	//adder의 inpu2 설정
	always @ (posedge clk or posedge rst) begin
		if (rst)
			begin
				Phase_accumulator_init_delay <= 32'b0;
				added_data <= 32'b0;
			end
		else if (count == countNUM-1)
			begin
				Phase_accumulator_init_delay <= Phase_accumulator_init; //count가 맞을때만 input넣음
				added_data <= answer_saved;
			end
		else
			begin 
				Phase_accumulator_init_delay <= 0;
				added_data <= 0;
			end
	end
	//answer가 0이 아니면 answer_saved에 answer 저장
		always @ (posedge clk or posedge rst) begin
		if (rst)
			begin
				answer_saved <= 32'b0;
			end
		else if(answer != 32'b0)
			begin
				answer_saved <= answer; //count가 맞을때만 input넣음 (saved된 answer)
			end
		else
			answer_saved <= 32'b0;
	end
*/
	/*
	always @ (posedge clk or posedge rst)
		begin
			if(rst == 1'b1)
				begin	
					added_data <= 32'b0;
					d_1clk <= 32'b0;
					d_2clk <= 32'b0;
					d_3clk <= 32'b0;
					d_4clk <= 32'b0;
				end
			else
				begin
					d_1clk <= answer;
					d_2clk <= d_1clk;
					d_3clk <= d_2clk;
					d_4clk <= d_3clk;
					added_data <= d_4clk;
				end
		end


	N_bit_adder adder_32bit (clk, rst, Phase_accumulator_init, added_data, answer);
		*/

	always @ (posedge clk or posedge rst) begin
		if (rst)
			begin
				added_data <= 32'b0;
			end
		else
			begin 
				added_data <= Phase_accumulator_out;
			end
	end
	
	assign Phase_accumulator_out = (Phase_accumulator_in + added_data);
	
endmodule
