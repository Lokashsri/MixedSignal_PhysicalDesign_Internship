`timescale 1ns/1ps


module AMUX2_3V_tb;

reg I0;
reg I1;
reg select;
wire out;

AMUX2_3V dut(
    .I0(I0),

    .I1(I1),
    .select(select),
    .out(out)
);

initial begin

    $dumpfile("amux.vcd");
    $dumpvars(0, AMUX2_3V_tb);

    I0 = 0;
    I1 = 1;

    select = 0;
    #10;

    select = 1;
    #10;

    I0 = 1;
    I1 = 0;

    select = 0;
    #10;

    select = 1;
    #10;

    $finish;

end

endmodule
