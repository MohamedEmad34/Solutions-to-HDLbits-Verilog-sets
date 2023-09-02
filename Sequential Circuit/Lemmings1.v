module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

     parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        case(state)
            0:begin if({bump_left,bump_right}==2'b10||{bump_left,bump_right}==2'b11)
                next_state<=RIGHT;
            else 
                next_state<=state;
            end
            1:begin if({bump_left,bump_right}==2'b01||{bump_left,bump_right}==2'b11)
                next_state<=LEFT;
                else
                    next_state<=state;
            end
        endcase
               
           
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=LEFT;
        else
            state<=next_state;
            
            
            
        
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state ==RIGHT );

endmodule
