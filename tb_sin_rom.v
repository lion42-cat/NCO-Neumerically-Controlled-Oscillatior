`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_sin_rom;
reg[3:0] addr;
wire [7:0] dout;

sin_rom sin_rom1 (
.addr(addr), 
.dout(dout)
);

initial begin
	addr = 0;
	#5; addr = 1;
	#5; addr = 2;
	#5; addr = 3;
	#5; addr = 4;
	#5; addr = 5;
	#5; addr = 6;
	#5; addr = 7;
	#5; addr = 8;
	#5; addr = 9;
	#5; addr = 10;
	#5; addr = 11;
	#5; addr = 12;
	#5; addr = 13;
	#5; addr = 14;
	#5; addr = 15;
	#5;
	$finish;
end
	
endmodule
