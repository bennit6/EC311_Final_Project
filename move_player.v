`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 06:56:51 PM
// Design Name: 
// Module Name: move_player
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

//player height is from bottom left corner of player rectangle (assumed 40x60)
module move_player(clk, grav_dir, is_dead, lines,  height);
    input            clk;           // clock
    input            grav_dir;      // direction of gravity (0 down, 1 up)
    input            is_dead;       // if player is dead (0 no, 1 yes)
    input      [2:0] lines;         // Whether the ground exists at each of the 3 heights (120,240,360) at the horizontal location of the bottom left corner of the player.
    output reg [8:0] height;        // height of bottom left corner of player
    reg        [8:0] next;          // next height
    
    initial begin
    height = 240;                   //starts player at height of middle line
    end
    
    always @ (posedge clk) begin
        if (is_dead==0)
            height <=next;
    end
    
    always @ (*) begin
        if (grav_dir==0) begin                                      // downward gravity
            if(height==120 & lines[0] | height==240 & lines[1])         
                next = height;                                        // don't change height if running on one of the lines
            else
                next = height-1;                                      // decrease height by 1 each clock cycle if not on one of lines
        end 
        else begin                                                  // upward gravity
            if(height==180 & lines[1] | height==300 & lines[2])
                next = height;                                        // down change height if on bottom of a line
            else
                next = height+1;                                      // increase height by 1 each clock cycle if not on bottom of line
        end
    
    end
endmodule
