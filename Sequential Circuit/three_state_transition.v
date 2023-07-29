module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    always @(*)
        begin
            case(state)
                2'b00:begin
                    out=0;
                    if(in)
                        next_state=B;
                    else
                        next_state=A;
                end
                2'b01:begin 
                    out=0;
                    if(in)
                          next_state=B;
                    else
                       next_state=C;
                end
                2'b10:begin
                    out=0;
                    if(in)
                     next_state=D;
                    else
                        next_state=A;
                end
                2'b11:begin
                    out=1;
                    if(in)
                        next_state=B;
                    else
                        next_state=C;
                end
            endcase
        end
    // Output logic:  out = f(state) for a Moore state machine

endmodule
