`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.01.2025 02:18:58
// Design Name: 
// Module Name: TB
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




module TB;
    // Testbench signals
    reg clk;
    reg reset;
    reg [15:0] duty;
    reg [31:0] freq;
    wire pwm_out;

    // Clock period (10ns = 100 MHz)
    localparam CLOCK_PERIOD = 10;

    // Instantiate the PWM generator
    pwm_generator #(
        .CLOCK_FREQ(100_000_000) // System clock frequency: 100 MHz
    ) uut (
        .clk(clk),
        .reset(reset),
        .duty(duty),
        .freq(freq),
        .pwm_out(pwm_out)
    );

    // Clock generation
    always #(CLOCK_PERIOD / 2) clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        duty = 16'd32768; // 50% duty cycle
        freq = 32'd1_000; // 1 kHz frequency

        // Reset the design
        #(2 * CLOCK_PERIOD);
        reset = 0;

        // Test 1: 50% duty cycle at 1 kHz
        #(100_000 * CLOCK_PERIOD);

        // Test 2: 25% duty cycle at 2 kHz
        duty = 16'd16384; // 25% duty cycle
        freq = 32'd2_000; // 2 kHz frequency
        #(100_000 * CLOCK_PERIOD);

        // Test 3: 75% duty cycle at 500 Hz
        duty = 16'd49152; // 75% duty cycle
        freq = 32'd500;   // 500 Hz frequency
        #(100_000 * CLOCK_PERIOD);

        // Test 4: 10% duty cycle at 10 kHz
        duty = 16'd6554;  // 10% duty cycle
        freq = 32'd10_000; // 10 kHz frequency
        #(100_000 * CLOCK_PERIOD);

        // End simulation
        $stop;
    end

endmodule

