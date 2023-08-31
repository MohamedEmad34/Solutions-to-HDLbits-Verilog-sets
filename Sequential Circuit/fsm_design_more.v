module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    localparam [2:0] s0=3'b000,//below s1
    s1=3'b001,//between s1 and s3 previous lower than current and below s2
    s2=3'b010,//between s1 and s3 previous higher than curent and below s2
    s3=3'b011,//between s1 and s3 previous lower than curent and above s2
    s4=3'b100,//between s1 and s3 previous higher than curent and above s2 
    s5=3'b101;//above s3
    reg [2:0] state,next_state;
    always @(posedge clk)
        begin
            if(reset)
                state<=s0;
            else
                state<=next_state;
       
        end
    always @(*)
        begin
            case(state)
                s0:next_state=s[1]?s1:s0;
                s1:next_state=s[2]?s3:(s[1]?s1:s0);
                s2:next_state=s[2]?s3:(s[1]?s2:s0);
                s3:next_state=s[3]?s5:(s[2]?s3:s2);
                s4:next_state=s[3]?s5:(s[2]?s4:s2);
                s5:next_state=s[3]?s5:s4;
            endcase
               
        end
    always @(*)
        begin
            case (state)
                s0:{dfr,fr3,fr2,fr1}=4'b1111;
                s1:{dfr,fr3,fr2,fr1}=4'b0011;
                s2:{dfr,fr3,fr2,fr1}=4'b1011;
                s3:{dfr,fr3,fr2,fr1}=4'b0001;
                s4:{dfr,fr3,fr2,fr1}=4'b1001;
                s5:{dfr,fr3,fr2,fr1}=4'b0000;
                default:{dfr,fr3,fr2,fr1}=4'bxxxx;
                
            endcase
        end
    
endmodule
