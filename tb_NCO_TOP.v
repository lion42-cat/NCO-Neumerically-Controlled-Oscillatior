`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_NCO_TOP;

reg clk_top;
reg rst_top;
reg [31:0] NCO_in;
wire [7:0] NCO_out;
integer i;

TOP_NCO TOP_NCO_1(
.clk_top(clk_top),
.rst_top(rst_top),
.NCO_in(NCO_in),
.NCO_out(NCO_out)
);
always #(1) clk_top = ~clk_top;

initial begin
	clk_top = 0; rst_top=1; NCO_in=0; //신호초기화
	for(i=0;i<100; i=i+1)
		begin
			#1; rst_top=0; NCO_in=268435450;
		end

	$finish;
end
endmodule
