`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_Quantizer32to4;

reg[31:0] Quantizer32to4_in;
wire[3:0] Quantizer32to4_out;

Quantizer_32to4 Q_A1(.Quantizer32to4_in(Quantizer32to4_in),
 .Quantizer_32to4_out(Quantizer32to4_out) );

initial begin
//2^28 = 268435456
Quantizer32to4_in = 0;
#5 Quantizer32to4_in = 268435456;  //2^28
#5 Quantizer32to4_in = 805306368; //2^28*3
#5 Quantizer32to4_in = 805307368; //2^28*3 + 1000
#5 Quantizer32to4_in = 1024;
#5 Quantizer32to4_in = 1073741829; //2^28*4 + a
#5 Quantizer32to4_in = 2147483659; //2^28*8 + a
#5
$finish;
end

endmodule
