module left_shifter (
  input [7:0] inp,
  input [1:0] shift_cntrl,
  output reg [15:0] shift_out
);
  always @*
  begin
    case (shift_cntrl)
      2'b00: shift_out = {8'b0, inp}; // No shift
      2'b01: shift_out = {4'b0, inp, 4'b0}; // 4-bit shift left
      2'b10: shift_out = {inp, 8'b0}; // 8-bit shift left
      default: shift_out = {8'b0, inp}; // Default to no shift
    endcase
  end   
endmodule