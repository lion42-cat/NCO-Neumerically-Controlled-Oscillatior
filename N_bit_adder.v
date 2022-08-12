`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module N_bit_adder(clk, rst, input1_in, input2_in, answer_out);
parameter N=32; //32bit adder
input clk, rst;
input [N-1:0] input1_in, input2_in;
output [N-1:0] answer_out;

wire [N-1:0] input1, input2;
wire [N-1:0] answer;

wire carry_out;
wire [N-1:0] carry;

//in
	dff input1_a(input1_in, clk, rst, input1);
	dff input2_a(input2_in, clk, rst, input2);
	
//calculate
	genvar i;

	generate
	for(i=0; i<N; i=i+1)
	begin : generate_N_bit_Adder
		if(i==0)
		begin
		half_adder f(clk, rst, input1[0], input2[0], answer[0], carry[0]);
		end
		else
		full_adder f_i(clk, rst, input1[i], input2[i], carry[i-1], answer[i], carry[i]);
	end
	assign carry_out = carry[N-1];
	endgenerate
	
//out
	assign answer_out = answer;
	
endmodule
