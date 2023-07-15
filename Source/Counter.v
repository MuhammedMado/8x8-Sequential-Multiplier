module Counter (
  input wire aclr_n,   // Active-low asynchronous reset
  input wire clk,      // Clock input
  output reg [1:0] count_out  // Counter output
);

  always @(posedge clk or negedge aclr_n) begin
    if (aclr_n == 0)   // Reset condition
     count_out <= 2'b00;
    else               // Increment counter
      count_out <= count_out + 1;
  end

endmodule