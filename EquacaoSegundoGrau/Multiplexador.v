module Multiplexador(
	input [15:0] x,
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [1:0] selecao,
	output reg [15:0] saida);

	always @ (x or a or b or c or selecao) begin
		case (selecao)
			2'b00: saida = x;
			2'b01: saida = a;
			2'b10: saida = b;
			2'b11: saida = c;
		endcase
	end
	
endmodule