`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 12:20:25 PM
// Design Name: 
// Module Name: move_testbemch
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


module move_testbemch();
    reg clk,is_dead,grav_dir;
    wire [8:0] height;
    reg [2:0] lines;
    reg [10:0] count;
    
    initial begin
    clk = 0;
    is_dead=0;
    grav_dir=0;
    lines=3'b111;
    count=0;
    end
    
    move_player test(clk, grav_dir, is_dead, lines,  height);
    
    always #1 begin
    clk=~clk;
    end
    
    always #2 begin
    count=count+1;
    end
    
    always @(*) begin
    if (count==10)
        lines=3'b101;
    if (count==140)
        lines=3'b110;
    if (count==422)
        lines=3'b011;
    
    if (count==552)begin
        grav_dir=1;
        lines=3'b111;
    end
    
    if (count==682)
        lines=3'b011;
    if (count==1024)
        lines=3'b110;
    if (count==1154)
        lines=3'b101;
        
    if (count==1286)begin
        lines=3'b000;
        is_dead=1;
    end
    end
endmodule
