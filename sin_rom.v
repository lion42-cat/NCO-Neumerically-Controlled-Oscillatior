`timescale 1ns / 1ps
module sin_rom(addr, dout);
input[3:0] addr;
output [7:0] dout;
reg[7:0] dout;

always @ (addr) begin
	case (addr)
		4'd0  : dout <= 128;
		4'd1  : dout <= 177;
		4'd2  : dout <= 219;
		4'd3  : dout <= 246;
		4'd4  : dout <= 255;
		4'd5  : dout <= 246;
		4'd6  : dout <= 219;
		4'd7  : dout <= 177;
		4'd8  : dout <= 128;
		4'd9  : dout <= 79;
		4'd10 : dout <= 37;
		4'd11 : dout <= 10;
		4'd12 : dout <= 0;
		4'd13 : dout <= 10;
		4'd14 : dout <= 37;
		4'd15 : dout <= 79;
		
		
		default : dout = 0;
	endcase
end
			
endmodule







		//("128","177","219","246","256","246","219","177",
//--"128","79","37","10","0","10","37","79");
