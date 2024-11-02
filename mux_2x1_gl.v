// modulo responsavel pelo mux 2 x 1

module mux_2x1_gl(
input I0,I1,S,
output Y);
wire sb,a,b;

not(sb,S);
and(a,sb,I0);
and(b,S,I1);
or(Y,a,b);
                
endmodule