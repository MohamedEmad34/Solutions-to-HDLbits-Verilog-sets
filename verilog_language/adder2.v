module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire co;
    add16(a[15:0],b[15:0],0,sum[15:0],co);
    add16(a[31:16],b[31:16],co,sum[31:16],);

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
wire s1,c1,c2;
    assign s1=a^b;
   assign c1=a&b;
   assign sum=s1^cin;
   assign c2=s1&cin;
  assign  cout=c1|c2;
endmodule
