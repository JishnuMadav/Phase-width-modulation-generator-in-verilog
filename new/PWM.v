`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.01.2025 23:34:54
// Design Name: 
// Module Name: PWM
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


module pwm_generator (
    input wire clk,          
    input wire reset,       
    input wire [15:0] duty,  
    input wire [31:0] freq,  
    output reg pwm_out      
);

    
    parameter CLOCK_FREQ = 100_000_000; 

 
    reg [31:0] counter;
    reg [31:0] compare_value;
    reg [31:0] period;

    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            period <= 0;
            compare_value <= 0;
        end else begin
            period <= CLOCK_FREQ / freq;                  
            compare_value <= (duty * period) >> 16;     
        end
    end

    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            pwm_out <= 0;
        end else begin
            if (counter < period - 1) begin
                counter <= counter + 1;
            end else begin
                counter <= 0; // Reset counter at the end of the period
            end

            
            pwm_out <= (counter < compare_value) ? 1 : 0;
        end
    end

endmodule
