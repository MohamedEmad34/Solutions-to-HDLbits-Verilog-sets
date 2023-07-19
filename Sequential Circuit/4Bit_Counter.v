module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    reg q_next;
    always @(posedge clk)
        begin
            if(reset|(q==15))
                q<=0;
            else
                q<=q+1;
        end
   
endmodule
