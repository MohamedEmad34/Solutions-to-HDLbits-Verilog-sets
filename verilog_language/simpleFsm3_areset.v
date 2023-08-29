module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    localparam [2:0]A=3'b000;
    localparam [2:0]B=3'b001;
    localparam [2:0]C=3'b010;
    localparam [2:0]D=3'b100;
    reg [2:0]state,next_state;
    
    
    // State transition logic

    // State flip-flops with asynchronous reset
    always @(posedge clk,posedge areset)
        begin
            if(areset)
                state<=0;
            else
                state<=next_state;
        end
    always @(*)
        begin
            case(state)
                A:begin
                    if(in)
                        next_state=B;
                    else
                       next_state=A; 
                end
                B:begin
                    if(in)
                        next_state=state;
                    else
                        next_state=C;
                end
                C:begin
                    if(in)
                        next_state=D;
                    else
                        next_state=A;
                end
                D:begin
                    if(in)next_state=B;
                    else
                        next_state=C;
                end
            endcase
        end

    // Output logic
    assign out=(state==D)?1:0;
endmodule
