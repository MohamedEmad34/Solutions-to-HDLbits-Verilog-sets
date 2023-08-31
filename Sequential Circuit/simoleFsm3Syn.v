module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    localparam [3:0]A=4'b0001,
                B=4'b0010,
    C=4'b0100,
    D=4'b1000;
    reg [3:0]state, next_state;
    

    // State transition logic
    always @(posedge clk)
        begin
            if(reset)
                state<=A;
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
                       next_state=state;
               end
               B:
                   begin
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
                   if(in)
                       next_state=B;
                   else
                       next_state=C;
               end
           endcase
       end

    // State flip-flops with synchronous reset

    // Output logic
    assign out=(state==D);

endmodule
