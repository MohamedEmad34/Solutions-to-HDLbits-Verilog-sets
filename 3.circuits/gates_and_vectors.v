module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    always @(*)
        begin
            integer i;
            for(i=0;i<3;i=i+1)
                begin
                    out_both[i]=in[i]&in[i+1];
                    out_different[i]=in[i]^in[i+1];
                end 
        end
    always @(*)
        begin
            integer k;
            for(k=3;k>=1;k=k-1)
                begin
                    out_any[k]=in[k]|in[k-1];
                end 
        end
    assign out_different[3]=in[3]^in[0];
    
                   
endmodule
