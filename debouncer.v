`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2021 03:24:30 PM
// Design Name: 
// Module Name: debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// debouncer module
module debouncer(clk_i, reset_i, buttonin_i, buttonout_o);
    input             clk_i, reset_i, buttonin_i;
    output reg        buttonout_o;
    
    reg               o_yet;
    reg   [15:0]       MAX,counter;
    
    initial begin
        o_yet   = 0;
        counter = 16'b0000000000000000;
        MAX     = 50000;
        buttonout_o=0;
    end
    
    always @ (posedge clk_i or negedge reset_i) begin
        if (reset_i==0) begin
            o_yet       = 0;
            counter = 16'b0000000000000000;
         end 
         
         else begin
            if(buttonin_i) 
                if(o_yet)
                    buttonout_o = 0;                    //output    (button pressed, but already incremented for this press)
                else begin
                    counter = counter + 1'b1;
                    if (counter==MAX) begin
                        buttonout_o = 1;                //output    (button presse, not incremented yet, got to max so increment)
                        o_yet       = 1;
                        counter     = 16'b0000000000000000;
                    end
                    else
                        buttonout_o = 0;                //output    (button presse, not incremented yet, not at max so no increment)
                end
           
           else begin
                buttonout_o = 0;                        //output    (button not pressed so no increment)
                o_yet       = 0;
                counter     = 16'b0000000000000000;
           end
                 
        end
            
    
    end



endmodule
