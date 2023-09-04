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
    reg [6:0]count=1;
    parameter [2:0]WALKLEFT=3'b000,
    WALKRIGHT=3'b001,
    DIGRIGHT=3'b010,
    DIGLEFT=3'b011,
    FALLLEFT=3'b100,
    FALLRIGHT=3'b101,
    SPLATTER=3'b110;
    always @(posedge clk or posedge areset)
        begin
            if(areset)
                begin
                count<=0;
                state<=WALKLEFT;
                end
               
                else
                begin
                    if(state==FALLLEFT||state==FALLRIGHT)
                        begin
                        count<=count+1;
                            state<=next_state;
                        end
                    else
                        begin
                            state<=next_state;
                            count<=0;
                        end
                end
                
            
        end
    always @(*)
        begin
            case(state)
                WALKLEFT: next_state=ground?(dig?DIGLEFT:(bump_left?WALKRIGHT:state)):FALLLEFT;
                WALKRIGHT:next_state=ground?(dig?DIGRIGHT:(bump_right?WALKLEFT:state)):FALLRIGHT;
                FALLLEFT:next_state=ground?((count>19)?SPLATTER:WALKLEFT):state;
                FALLRIGHT:next_state=ground?((count>19)?SPLATTER:WALKRIGHT):state;
                DIGLEFT:next_state=ground?state:FALLLEFT;
                DIGRIGHT:next_state=ground?state:FALLRIGHT;
                SPLATTER:next_state=state;
            endcase
        end
            assign walk_left=(state==WALKLEFT);
            assign walk_right=(state==WALKRIGHT);
    assign aaah=(state==FALLLEFT)||(state==FALLRIGHT);
            assign digging=(state==DIGLEFT)||(state==DIGRIGHT);
                
                
           

endmodule
