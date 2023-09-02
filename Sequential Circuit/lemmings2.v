module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    reg [1:0]state,next_state;
    localparam [1:0]FALL_LEFT=2'b00,
    FALL_RI=2'b01,
    WALK_LEFT=2'b10,
    WALK_RI=2'b11;
    always @(posedge clk or posedge areset)
        begin
            if(areset)
                state<=WALK_LEFT;
            else
                state<=next_state;
        end
    always @(*)
        begin
            case(state)
                FALL_LEFT:next_state=ground?WALK_LEFT:state;
                FALL_RI:next_state=ground?WALK_RI:state;
                WALK_LEFT:next_state=ground?(bump_left?WALK_RI:WALK_LEFT):FALL_LEFT;
                WALK_RI:next_state=ground?(bump_right?WALK_LEFT:WALK_RI):FALL_RI;
            endcase
        end
    assign aaah=(state==FALL_LEFT)||(state==FALL_RI);
    assign walk_left=(state==WALK_LEFT);
    assign walk_right=(state==WALK_RI);
        
    
   

endmodule
