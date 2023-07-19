module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF d1(KEY[0],KEY[1],KEY[2],KEY[3],SW[3],LEDR[3]);
    MUXDFF d2(KEY[0],KEY[1],KEY[2],LEDR[3],SW[2],LEDR[2]);
    MUXDFF d3(KEY[0],KEY[1],KEY[2],LEDR[2],SW[1],LEDR[1]);
    MUXDFF d4(KEY[0],KEY[1],KEY[2],LEDR[1],SW[0],LEDR[0]);
    

endmodule

module MUXDFF (input clk,input E,input L,input W,input R,output o);
   wire y1,y2;
    assign y1=E?W:o;
    assign y2=L?R:y1;
    always @(posedge clk)
        begin
            o<=y2;
        end
endmodule
