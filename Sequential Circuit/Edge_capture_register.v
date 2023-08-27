module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]temp;
    always @(posedge clk)
        begin
            temp<=in;
            if(reset)
                out<=0;
            else
                begin
                
            for(int i=0;i<=31;i++)
                begin
                    if(temp[i]&!in[i])
                        out[i]<=1; 
                    
                end
                end
        end

endmodule
