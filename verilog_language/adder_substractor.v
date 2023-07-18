module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] xoredB;
    wire cout;
    always @(*)
        begin
            xoredB={32{sub}}^b[31:0];
        end
    
    add16 add1(a[15:0],xoredB[15:0],sub,sum[15:0],cout);
    add16 add2(a[31:16],xoredB[31:16],cout,sum[31:16],);
    

endmodule
