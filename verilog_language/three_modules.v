module top_module ( input clk, input d, output q );
    wire l,m;
    my_dff(clk,d,l);
    my_dff(clk,l,m);
    my_dff(clk,m,q);

endmodule
