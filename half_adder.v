`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module half_adder(clk, rst, x_in, y_in, s_out, c_out);
   input clk, rst;
   input x_in,y_in;
   output s_out,c_out;
   
   wire x,y;
   reg s_out,c_out;
   
   //in
   dff xx_h(x_in, clk, rst, x);
   dff yy_h(y_in, clk, rst, y);
      
   //calculate
   //pipelining
	always @ (posedge clk or posedge rst) 
		begin
			if (rst == 1'b1) 
				begin
					s_out <= 0;
					c_out <= 0;
				end
			else
				begin
					s_out <= x^y;
					c_out <= x&y;
				end
		end
endmodule // half adder
