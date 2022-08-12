`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////////////////////////
module dff_16bit(d, clk, rst, q);
input clk, rst;
input [15:0] d;
output [15:0] q;
reg [15:0] q;

always @ (posedge clk or posedge rst) begin
	if (rst == 1'b1)
		q <= 15'b0;
	else 
		q <= d;
end

endmodule
