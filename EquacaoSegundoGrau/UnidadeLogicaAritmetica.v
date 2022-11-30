module UnidadeLogicaAritmetica(
	input [15:0] valor1,
	input [15:0] valor2,
	input selecao,
	output reg [15:0] resultado);

	always @ (selecao or valor1 or valor2) begin
		case (selecao)
			1'b0: resultado = valor1 + valor2;
			1'b1: resultado = valor1 * valor2;
		endcase
	end
	
endmodule