# Phase-width-modulation-generator-in-verilog
This Verilog module implements a Pulse Width Modulation (PWM) generator. It takes a clock signal, a reset signal, and a duty cycle value as inputs, and produces two outputs: a PWM signal and a cycle signal.

The duty cycle input, specified as an integer between 0 and 
2
dutywidth
2 
dutywidth
 , determines the percentage of time the PWM signal remains high during each cycle. The dutywidth parameter is user-configurable, allowing for adjustments to the resolution of the PWM signal.

The PWM signal is generated as a square wave, with its duty cycle corresponding to the specified input value. Additionally, the module outputs a cycle signal, which goes high for a single clock cycle at the end of each PWM cycle, indicating the completion of a cycle.

Internally, the module uses a counter that increments with each clock cycle. The counter value is compared to the input duty cycle value to control the PWM signal's high and low states.

This module is designed to be easily integrated into larger designs and can be customized by modifying the dutywidth parameter to meet specific application requirements.
