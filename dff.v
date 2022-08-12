`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////////////////////////
module dff(d, clk, rst, q);
input clk, rst;
input [31:0] d;
output [31:0] q;
reg [31:0] q;

always @ (posedge clk or posedge rst) begin
	if (rst == 1'b1)
		q <= 32'b0;
	else 
		q <= d;
end

endmodule
