`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module dff_1bit(d, clk, rst, q);
input clk, rst;
input d;
output q;
reg q;

always @ (posedge clk or posedge rst) begin
	if (rst == 1'b1)
		q <= 1'b0;
	else 
		q <= d;
end
endmodule
