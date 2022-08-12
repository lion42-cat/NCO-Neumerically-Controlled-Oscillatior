`timescale 1ns / 1fs
//////////////////////////////////////////////////////////////////////////////////
module TOP_NCO(clk_top, rst_top ,NCO_in, NCO_enable ,NCO_sin_out, NCO_cos_out);
input clk_top, rst_top;
input [31:0] NCO_in;
input NCO_enable;
output [15:0] NCO_sin_out, NCO_cos_out;

wire [31:0] Phase_accumulator_out; //go to Quantizer
wire [31:0] Quantizer32to16_out; //go to sin_cos_rom

Phase_accumulator Phase_accumulator_1 (clk_top, rst_top, NCO_in, NCO_enable, Phase_accumulator_out);
Quantizer32to16 Quantizer32to16_1 (clk_top, rst_top, Phase_accumulator_out, Quantizer32to16_out);
sin_cos_rom sin_cos_rom_1 (clk_top, rst_top, Quantizer32to16_out, NCO_sin_out, NCO_cos_out);

endmodule
