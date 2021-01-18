TASK 2
======

Step 1: Viewing the design
--------------------------
Opening up the task1_top instance in the Technology Map Viewer, we can draw the following links between the visual representation and the compilation report:
- **8 logic elements:** these map to the 7 or gates and 1 decoder used inside the hex_to_7seg block.
- **11 total pins:** these map to the 4 input and 7 output pins used by the module.

Step 2: Timing Analyzer
-----------------------
When opening the timing analyzer, when setting the operating conditions to the Slow 1200mV 85C model we obtain a the maximum RR (rising edge to rising edge) propagation delay between pins SW[2] and HEX0[1] of 9.269 (when using the datasheet for the minimum propagation delay).

If we change the operating temperature to 0C, we notice a drop in the propagation delay for all pins, with the slowest connection (still SW[2] and HEX0[1]) only taking 8.505. This reduced speed is likely due to the fact that the resistivity increases with increasing temperature in conductors. Therefore decreasing the temperature a device operates under is going to reduce the resistivity of the conductors used in the circuit, effectively reducing the time taken for electrons to flow through the circuit, reducing the propagation delay.

*Note: for copper, resistivity can be expressed as a linear function of temperature*

Step 3: Test yourself
---------------------
The goal is to extend task 1 to now utilise all 10 switches of the board, requiring 3 hex LCD displays to represent the 10-bit number. To do this, I simply created 2 additional instances of the hex_to_7seg module in the top level module, routing the appropriate bits as the inputs and using HEX1 and HEX2 as the outputs for the newly added, more significant bits.

For HEX2, we only have the 2 most significant bits of from the switches we need to process, so I concatenated 2 0s to ensure that the input had the correct width. I could've created a module using 2 fewer gates, as the gates for managing the 2 MSB will never be used, but that seemed unnecessary and reusing the same module was a more elegant solution.

When updating the .qsf file to ensure the pins were mapped correctly, I noticed that the HEX1 and HEX2 pins were mapped as I expected when importing *pin_assignment.txt*, and that all 10 bits of SW were mapped appropriately.
