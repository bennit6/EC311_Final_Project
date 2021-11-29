`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 11:33:48 AM
// Design Name: 
// Module Name: gravity_direction_testbench
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


module gravity_direction_testbench();
    wire dir;
    reg clk,reset,is_dead,switch;
    reg [8:0] height;
    reg [2:0] lines, multiplyer;
    
    initial begin
    clk = 0;
    reset=1;
    is_dead=0;
    switch=0;
    height=0;
    multiplyer=0;
    lines=3'b000;
    end
    
    gavity_direction  test(clk, reset, is_dead, switch, lines, height, dir);
    
    always #1 begin
    clk=~clk;
    end
    
    always #2 begin
    lines=lines+1;
    end
    
    always #16 begin
    multiplyer=multiplyer+1;
    height=60*multiplyer;
    end
    

    
    always #128 begin
    switch=~switch;
    end
    
    always #256 begin
    is_dead=~is_dead;
    end
    
    always #512 begin
    reset=~reset;
    end
    
endmodule
