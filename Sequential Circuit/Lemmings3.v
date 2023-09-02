module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    reg [2:0]state,next_state;
    parameter [2:0]WALK_LEFT=2'b000,
    WALK_RI=3'b001,
    FALL_LEFT=3'b010,
    FALL_RI=3'b011,
    DIG_LEFT=3'b100,
    DIG_RI=3'b101;
    
    always @(posedge clk, posedge areset)
        begin
            if(areset)
                state<=WALK_LEFT;
            else
                state<=next_state;
        end
    always @(*)
        begin
            case(state)
                WALK_LEFT:next_state=ground?(dig?DIG_LEFT:(bump_left?WALK_RI:WALK_LEFT)):FALL_LEFT;
                WALK_RI:next_state=ground?(dig?DIG_RI:(bump_right?WALK_LEFT:WALK_RI)):FALL_RI;
                FALL_LEFT:next_state=ground?WALK_LEFT:state;
                FALL_RI:next_state=ground?WALK_RI:state;
                DIG_LEFT:next_state=ground?state:FALL_LEFT;
                DIG_RI:next_state=ground?state:FALL_RI;
            endcase
                
        end
    assign walk_left=(state==WALK_LEFT);
    assign walk_right=(state==WALK_RI);
    assign aaah=(state==FALL_LEFT)||(state==FALL_RI);
    assign  digging=(state==  DIG_LEFT)||(state==DIG_RI);

endmodule
