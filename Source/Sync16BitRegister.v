module Sync16BitRegister(
  input wire [15:0] datain,   
  input wire sclr_n,          // Active-low synchronous reset
  input wire clk_ena,         // Clock enable
  input wire clk,             
  output reg [15:0] reg_out   
);
  always @(posedge clk) begin
    if (sclr_n == 0)      // Reset condition
      reg_out <= 0;
      
    else if (clk_ena == 1) // Clock enabled
      reg_out <= datain;
  end

endmodule