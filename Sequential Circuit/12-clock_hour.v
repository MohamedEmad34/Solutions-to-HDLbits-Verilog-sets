module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    reg [2:0]enable;
    assign enable ={(ena&&(mm==8'h59)&&(ss==8'h59)),(ena&&(ss==8'h59)),ena};
    
    always @(posedge clk)
        begin
            if(reset)
                begin               
                hh<=8'h12;
                pm<=0;
                end
            else
                begin
                    if(enable[2])
                        begin
                       if(hh == 8'h12)  hh <= 8'h1;  
                else if(hh == 8'h11) begin  
            		hh[3:0] <= hh[3:0] + 1'h1;
               		pm <= ~pm;
                end 
                else begin
                    if(hh[3:0] == 4'h9) begin
                        hh[3:0] <= 4'h0;
                        hh[7:4] <= hh[7:4] + 1'h1;
                    end
                    else hh[3:0] = hh[3:0] + 1'h1;
                end
            end
            else hh <= hh;
        end
                    
            
        
    end 
    count count1(clk,reset,enable[0],ss);
    count count2(clk,reset,enable[1],mm);
    
    
    

endmodule
module count(input clk, input reset, input ena, output reg [7:0]q);
    always @(posedge clk)
        begin
            if(reset)
                q<=0;
            else
                begin
                    if(ena)
                        begin
                            if(q[3:0]==9)
                                begin
                                    if(q[7:4]==5)
                                        q<=0;
                                    else
                                        begin
                                            q[7:4]<=q[7:4]+1;
                                            q[3:0]<=0;
                                        end
                                end
                            else
                                q[3:0]<=q[3:0]+1;                                    
                                
                        
                end
        end
        end
    
endmodule
