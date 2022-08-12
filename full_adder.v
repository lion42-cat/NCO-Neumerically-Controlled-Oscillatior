`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module full_adder(clk, rst, x_in, y_in, c_in, s_out, c_out);
input clk, rst;
input x_in, y_in,c_in;
output s_out, c_out;

wire x, y, c_init;
reg s_out, c_out;

//in

dff xx_f(x_in, clk, rst, x);
dff yy_f(y_in, clk, rst, y);
dff cc_f(c_in, clk, rst, c_init);

//calculate
 //pipelining
 always @ (posedge clk or posedge rst) 
	begin
		if (rst == 1'b1) 
			begin
			s_out <= 1'b0;
			c_out <= 1'b0;
			end
		else
			begin
			s_out <= (x^y)^c_init;
			c_out <= (y&c_init|(x&y)|(x&c_init));
			end
	end
	
endmodule 
