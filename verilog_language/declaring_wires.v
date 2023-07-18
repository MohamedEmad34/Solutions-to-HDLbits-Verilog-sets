module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire a1,a2,a3;
    assign a1=a&b;
    assign a2=c&d;
    assign out=a1|a2;
    assign out_n=~(a1|a2);

endmodule
