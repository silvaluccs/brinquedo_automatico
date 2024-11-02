/*
modulo responsavel pelo flipflop d usado no contador
*/

module FF_d(Q, clk, D);
  input D; // Data input 
  input clk; // clock input 
  output reg Q; // output Q 

  initial begin
    Q = 1'b0;
  end

  always @(posedge clk) begin
    Q <= D; 
  end 
endmodule 