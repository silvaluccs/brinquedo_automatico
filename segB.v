/*
Modulo responsavel pelo segmento b do display de 7 segmentos
*/

module segB(out, A, B, C);
	input A, B, C;
	output out;
	
	wire xorBC;
	
	xor Xor0(xorBC, B, C);
	and And0(out, xorBC, A);
	
endmodule
