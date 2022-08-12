`timescale 1ns / 1fs
//////////////////////////////////////////////////////////////////////////////////
module tb_sin_cos_rom;
reg clk,rst;
reg [15:0] addr_in;
wire [15:0] sin_out, cos_out;

sin_cos_rom u5(
.clk(clk),
.rst(rst),
.addr_in(addr_in),
.sin_out(sin_out),
.cos_out(cos_out)
);

always begin #1 clk=~clk; end
always begin #2 addr_in = addr_in +1; end
initial 
	begin
		clk=1; rst=1; addr_in=4095;  //rst=1이므로 addr=0
		#2 rst=0;
		
		#9100000 $finish;
	end

endmodule
