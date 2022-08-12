`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Quantizer32to16(clk, rst, Quantizer32to16_in, Quantizer32to16_out);
input clk, rst;
input [31:0] Quantizer32to16_in;
output [15:0] Quantizer32to16_out;

wire [31:0] Quantizer32to16_in_data;
wire [15:0] Quantizer32to16_out_data;

//in
	dff Qu_i(Quantizer32to16_in, clk, rst, Quantizer32to16_in_data);

//calculate
	assign Quantizer32to16_out_data = Quantizer32to16_in_data >> 16;

//out
	assign Quantizer32to16_out = Quantizer32to16_out_data;
	
endmodule
