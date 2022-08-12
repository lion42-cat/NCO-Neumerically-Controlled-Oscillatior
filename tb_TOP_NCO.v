`timescale 1ns / 1fs
//////////////////////////////////////////////////////////////////////////////////
module tb_TOP_NCO;
	reg clk_top, rst_top;
	reg [31:0] NCO_in;
	reg NCO_enable;
	wire [15:0] NCO_sin_out, NCO_cos_out;

	TOP_NCO u7(.clk_top(clk_top), .rst_top(rst_top),
	.NCO_in(NCO_in),
	.NCO_enable(NCO_enable),
	.NCO_sin_out(NCO_sin_out),
	.NCO_cos_out(NCO_cos_out)
	);
	
	always #(1) clk_top = ~clk_top;
	always #(2) begin rst_top = 0; NCO_enable=1; NCO_in=50000; end
	
	initial begin
	clk_top=1; rst_top=1; NCO_enable=0; NCO_in=0; //초기신호 초기화
	
	#3000000 $finish;
	end


endmodule
