/*
Modulo principal do sistema responsavel pelo funcionamento geral do circuito
*/

module main(a, b, c, d, e, f, g, p, d1, d2, d3, d4, clock_entrada, botao_in, chave1, chave2, power, led_vermelho, led_azul);

	input clock_entrada, botao_in, chave1, chave2, power;
	output a, b, c, d, e, f, g, p, d1, d2, d3, d4,  led_vermelho, led_azulx
	wire  bit0, bit1, bit2, ck1, ck2;
	wire [25:0] rl;
	
	assign led_vermelho = ~power; // acionamento do led rgb corresponde a corresponde ao estado da chave power
	assign led_azul = power; 

	divisor_frequencia dividirfreq(.bit0(bit2), .bit1(bit1), .bit2(bit0), .clock_entrada(clock_entrada), .botao(~power), .rl(rl));	// dividindo o clock inicial do circuito
	
	wire clock_contador; // clock que gerado pelo contador 
	wire [2:0] acoes; // fio resposavel por receber a açao atual do cachorro 

	// responsavel por gerar o clock para o contador sincrono
	gerenciar_tempo gerenciar_tempo_insta(.out(clock_contador), .A(bit0), .B(bit1), .C(bit2), .D(chave1), .E(chave2));
	
	contador_sincrono contador_sin(clock_contador, ~botao_in, acoes, power); // responsavel por contar o estado atual do cachorro
	
	wire notpower;
	
	not notPower(notpower, power);
	
	or orPower(d1, notpower, rl[11]); // desligar o mostrador de 7 segmentos se o botao estiver desligado
	
	nand Nandd2(d4, power, rl[11]);
	
	assign d2 = 1'b1;
	assign d3 = 1'b1;
	
	// mostrar as acoes atuais e a velocidade selecionada
	gerenciar_display gerenci(chave1, chave2, acoes[2], acoes[1], acoes[0], a, b, c, d, e, f, g, p, rl[11]);
	
endmodule