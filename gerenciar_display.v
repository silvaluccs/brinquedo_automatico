// modulo responsavel por ativar dois digitos no mostrador ao mesmo tempo

module gerenciar_display(chave1, chave2, bit0, bit2, bit1, a, b, c, d, e, f, g, p, aux);
input chave1, chave2, bit0, bit2, bit1, aux;
output  a, b, c, d, e, f, g, p;

wire va, vb, vc, vd, ve, vf, vg; // fios para os segmentos das acoes do cachorro

display display_acoes(bit0, bit1, bit2, va, vb, vc, vd, ve, vf, vg);

wire za, zb, zc, zd, ze, zf, zg; // fios para os segmentos da velocidade atual do cachorro

velocidade_atual vell(chave1, chave2, za, zb, zc, zd, ze, zf, zg);

// muxs para selecionar os segmentos atuais

mux_2x1_gl muxa(va, za, aux, a); 
mux_2x1_gl muxb(vb, zb, aux, b);
mux_2x1_gl muxc(vc, zc, aux, c);
mux_2x1_gl muxd(vd, zd, aux, d);
mux_2x1_gl muxe(ve, ze, aux, e);
mux_2x1_gl muxf(vf, zf, aux, f);
mux_2x1_gl muxg(vg, zg, aux, g);


assign p = 1'b1;
endmodule 