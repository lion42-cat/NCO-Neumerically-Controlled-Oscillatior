`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Phase_accumulator(clk, reset, Phase_accumulator_in, Phase_accumulator_out);
parameter N=32;
input clk, reset;
input [N-1:0] Phase_accumulator_in; //32bit 0000....001
output [N-1:0] Phase_accumulator_out; //go to quantizer
reg [N-1:0] d_1clk = 0;
reg [N-1:0] d_2clk = 0;
reg [N-1:0] d_3clk = 0;
reg [N-1:0] d = 0;   //register
wire [N-1:0] answer; //32bit_adder's answer

always @ (posedge clk or posedge reset)
	begin
		if(reset == 1'b1)
			d <= 32'b0;
		else
			d_1clk <= answer;
			d_2clk <= d_1clk;
			d_3clk <= d_2clk;
			d <= d_3clk;
	end
	
N_bit_adder adder_32bit (Phase_accumulator_in, d, answer);



assign Phase_accumulator_out = answer;

endmodule
