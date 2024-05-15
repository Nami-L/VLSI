module comb01 ( input wire [2:0] X,
                output wire F);
                
  assign F = (~X[2] & X[0]) | (X[2] & ~X[1]) | (~X[1] & X[0]);
endmodule