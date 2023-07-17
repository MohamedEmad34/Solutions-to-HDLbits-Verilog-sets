module top_module( 
    input a, b, sel,
    output out ); 
    always @(a,b,sel)
        begin
            case(sel)
                
                    0:out=a;
                    1:out=b;
                
            endcase
        end
endmodule
