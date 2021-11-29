`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 10:42:23 AM
// Design Name: 
// Module Name: gavity_direction
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

// 0 mean downward gravity (ie normal) and 1 means upward gravity (ie reverse)
// allows for change of gravity when button is pressed and player is on a line
module gavity_direction(clk, reset, is_dead, switch, lines, height, dir);
    input       clk, reset, switch, is_dead;
    input [2:0] lines;
    input [8:0] height;
    output reg  dir;
    reg         next;
    
    initial begin
        dir=0;
    end
    
    always @ (posedge clk) begin
        if (reset==0)
            dir <= 0;
        else if (is_dead==0)
            dir <= next;
    end
    
    always @ (*) begin
        next = dir;
        if (switch==1)
            if (dir==0) begin
                if(height==120 & lines[0] | height==240 & lines[1])
                    next = ~dir;
            end 
            else begin
                if(height==180 & lines[1] | height==300 & lines[2])
                    next = ~dir;
            end
     end   
endmodule
