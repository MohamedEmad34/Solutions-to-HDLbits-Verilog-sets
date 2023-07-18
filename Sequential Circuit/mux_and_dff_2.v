module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire y;
    always @(posedge clk)
        begin
            if(E)
                y=w;
            else
                y=Q;
            if(L)
                Q<=R;
            else
                Q<=y;
        end
            

endmodule
