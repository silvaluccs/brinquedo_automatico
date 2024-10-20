/*
Modulo principal do sistema
*/

module main(a, b, c, d, e, f, g, p, d1, d2, d3, d4, clock_entrada, botao, chave1, chave2);

	input clock_entrada, botao, chave1, chave2;
	output a, b, c, d, e, f, g, p, d1, d2, d3, d4;
	wire  bit0, bit1, bit2, notBotao;
	
	not Notbotao(notBotao, botao);
	
	divisor_frequencia dividirfreq(.bit0(bit2), .bit1(bit1), .bit2(bit0), .clock_entrada(clock_entrada), .botao(notBotao));
	
	// msb bit0 lsb bit2
	
	wire clock_contador;
	wire [2:0] acoes;
	
	gerenciar_tempo gerenciar_tempo_insta(.out(clock_contador), .A(bit0), .B(bit1), .C(bit2), .D(chave1), .E(chave2));
	
	contador_sincrono(clock_contador, notBotao, acoes);
	
	display display_acoes(acoes[0], acoes[1], acoes[2], d1, d2, d3, d4, a, b, c, d, e, f, g, p);
	
//	velocidade_atual(chave1, chave2, d2, d1, d3, d4, a, b, c, d, e, f, g, p);
	
//	display display_temporizador(~bit0, ~bit1, ~bit2, d3, d1, d2, d4, a, b, c, d, e, f, g, p);
	
endmodule