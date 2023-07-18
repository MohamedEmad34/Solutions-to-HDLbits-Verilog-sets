module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout1,cout2,cout3,cin;
    wire [15:0]sum1,sum2;
    add16 add1( a[15:0] ,b[15:0] ,  cin, sum[15:0] ,  cout1 );
    add16 add2( a[31:16] ,b[31:16] ,  0, sum1 ,   );
    add16 add3( a[31:16] ,b[31:16] ,  1, sum2 ,   );
    always @(cout1,a,b)
        begin
    case(cout1)        
            1'b0:sum[31:16]=sum1;
            1'b1:sum[31:16]=sum2;        
    endcase
        end
    



endmodule
