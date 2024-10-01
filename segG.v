/*
Modulo responsavel pelo segmento g do display de 7 segmentos
*/

module segG(out, A, B, C);

input A, B, C;
output out;

wire notA, notB, AndNots, AndABC;

not Not0(notA, A);
not Not1(notB, B);
and And0(AndNots, notA, notB);
and And1(AndABC, A, B, C);

or Or0(out, AndABC, AndNots);
endmodule