module Registrador16(
	input clock,
	input reset,
	input carga,
	input [15:0] entrada,
	output reg [15:0] resultado);

	always @ (posedge clock or reset) begin
		if (reset == 1) begin
			resultado = 16'b0000000000000000;
		end
		else begin
			if (carga == 1) begin
				resultado = entrada;
			end
		end
	end
	
endmodule