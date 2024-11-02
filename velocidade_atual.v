/*
Modulo responsavel para configurar o mostrador de 7 segmentos
para exibir a velocidade atual do robo
*/

module velocidade_atual(chave1, chave2, a, b, c, d, e, f, g, p);
 input chave1, chave2;
 output a, b, c, d, e, f, g, p;
 
 seg0 instanA(a, chave1, chave2);
 seg0 instanD(d, chave1, chave2);
 seg0 instanE(e, chave1, chave2);
 
 assign b = 1'b0;
 
 seg1 instanC(c, chave1, chave2);
 seg1 instanF(f, chave1, chave2);
 
 seg2 instanG(g, chave1, chave2);
 
 assign p = 1'b1;
endmodule

// os modulos abaixo configuram os segmentos para exibir 0, 2, 4 8. Com base nessas chaves.

module seg0(out, A, B);
input A, B;
output out;

wire notB;
not NotB(notB, B);
and and0(out, notB, A);

endmodule

module seg1(out, A, B);
input A, B;
output out;

wire notA;

not NotA(notA, A);
and And1(out, notA, B);

endmodule

module seg2(out, A, B);
input A, B;
output out;

wire notA, notB;
not NotA(notA, A);
not NotB(notB, B);
and And2(out, notA, notB);

endmodule
