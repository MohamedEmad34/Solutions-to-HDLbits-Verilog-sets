module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    assign ena={q[11:8]==9&&q[7:4]==9&&q[3:0]==9,q[7:4]==9&&q[3:0]==9,q[3:0]==9};

    bcd_counter counter1(clk,reset,1,q[3:0]);
    bcd_counter counter2(clk,reset,ena[1],q[7:4]);
    bcd_counter counter3(clk,reset,ena[2],q[11:8]);
    bcd_counter counter4(clk,reset,ena[3],q[15:12]);

endmodule
module bcd_counter(input clk, input reset, input enable, output reg [3:0]q);
    always @(posedge clk)
        begin
            if(reset)
                q<=0;
            else
                begin
                if(enable)
                  begin
                      if(q==9)
                          q<=0;
                      else
                          q<=q+1;
                  end
                end
        end
endmodule
