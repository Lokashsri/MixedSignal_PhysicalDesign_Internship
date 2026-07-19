
module AMUX2_3V (
   input I0,
   input I1,
   input select,
   output out
);

assign out = select ? I1 : I0;

endmodule

