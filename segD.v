/*
Modulo responsavel pelo segmento d do display de 7 segmentos
*/
module segD(out, A, B, C);

	input A, B, C;
	output out;

	wire NotxorBC;
	
	xnor Xnor0(NotxorBC, B, C);
	and And0(out, NotxorBC, A);

endmodule
