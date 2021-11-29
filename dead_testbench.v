`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 11:33:48 AM
// Design Name: 
// Module Name: dead_testbench
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


module dead_testbench();
reg [8:0] height;
wire       is_dead;

initial begin
    height = 250;
end

dead  test(height, is_dead);

always #1 begin
    height = height  + 1;
end

endmodule
