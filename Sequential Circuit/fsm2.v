// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  

    // Fill in state name declarations
parameter A=0,B=1;
    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset)   
            present_state<=B;
        else
            present_state<=next_state;
         
           
        end
    

            // State flip-flops
    always @(*)
        begin
            case (present_state)
                // Fill in output logic
                A:next_state=in?A:B;
                B:next_state=in?B:A;
            endcase
        end
    assign out=(present_state==B);
        
    

endmodule
