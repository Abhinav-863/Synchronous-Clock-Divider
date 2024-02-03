# Synchronous-Clock-Divider
This Sync Clock Divider module includes:

•i_func_clk: The functional clock input.

•i_scan_clk: The scan clock input.

•i_rst: An asynchronous reset input.

•i_sel: A 2-bit input to select the clock division factor (div2, div4, div8, or div16).

•i_bypass: A signal to choose between divided clocks and the scan clock.

•o_clk: The output clock.

The module uses a synchronous counter for clock division and a glitch-free clock multiplexer to select the desired divided clock or the scan clock based on the control signals. The o_clk output is generated accordingly.

![image](https://github.com/Abhinav-863/Synchronous-Clock-Divider/assets/113772669/8730ee88-e08e-449b-a5f6-d5bb0e078972)
