module Quantizer32to4(Quantizer32to4_in, Quantizer32to4_out);
parameter N=32;
input [N-1:0] Quantizer32to4_in;
output [3:0] Quantizer32to4_out;

assign Quantizer32to4_out = Quantizer32to4_in >>28;

endmodule
