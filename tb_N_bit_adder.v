`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_N_bit_adder;
reg clk, rst;
reg [31:0] input1_in, input2_in;
wire [31:0] answer_out;

N_bit_adder u3(
.clk(clk),
.rst(rst),
.input1_in(input1_in),
.input2_in(input2_in),
.answer_out(answer_out)
);

always begin #1 clk=~clk; end

initial
	begin
		clk=1; rst=1; input1_in=0; input2_in=0;
		#2 rst=0; input1_in=1; input2_in=0;
		#2 rst=0; input1_in=2; input2_in=0;
		#2 rst=0; input1_in=4; input2_in=4;
		#2 rst=0; input1_in=8; input2_in=8;
		#2 rst=0; input1_in=16; input2_in=16;
		#2 rst=0; input1_in=100; input2_in=100;
		#2 rst=0; input1_in=1000; input2_in=1000;
		#2 rst=0; input1_in=20000; input2_in=20000;
		#2 rst=0; input1_in=300000; input2_in=300000;
		#2 rst=0; input1_in=4000000; input2_in=4000000;
		#2 rst=0; input1_in=50000000; input2_in=50000000;
		#2 rst=0; input1_in=600000000; input2_in=600000000;
		#2 rst=0; input1_in=1; input2_in=1;
		#2 rst=0; input1_in=2; input2_in=2;
		#2 rst=0; input1_in=3; input2_in=3;
		#2 rst=0; input1_in=4; input2_in=4;
		#2 rst=0; input1_in=5; input2_in=5;
		
		#20 $finish;
	end

endmodule
