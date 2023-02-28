`timescale 1ns / 1ps

module helloworld(
			input Clk,
			input Reset,
			input UART_Rx,
			output UART_Tx
    );
	 
	 
	 
MicroBlaze mcs_0 (
  .Clk(Clk), // input Clk
  .Reset(Reset), // input Reset
  .UART_Rx(UART_Rx), // input UART_Rx
  .UART_Tx(UART_Tx) // output UART_Tx
);

endmodule
