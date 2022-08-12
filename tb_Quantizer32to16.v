`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_Quantizer32to16;
reg clk, rst;
reg [31:0] Quantizer32to16_in;
wire [31:0] Quantizer32to16_out;

Quantizer32to16 u4(
.clk(clk),
.rst(rst),
.Quantizer32to16_in(Quantizer32to16_in),
.Quantizer32to16_out(Quantizer32to16_out)
);

always begin #1 clk=~clk; end

initial
	begin
		clk=1; rst=1; Quantizer32to16_in=0;
		#2 rst=0; Quantizer32to16_in= 1000; //예측=0
		#2 rst=0; Quantizer32to16_in= 65535; //2^16 -1 //예측=0
		#2 rst=0; Quantizer32to16_in= 65536; //2^16  //예측=1
		#2 rst=0; Quantizer32to16_in= 131072; //2^16 *2
		#2 rst=0; Quantizer32to16_in= 327685; //2^16 *5 +5 /예측=5
		#2 $finish;
	end
endmodule
