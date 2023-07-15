module seven_segment_encoder(
  input [2:0] inp,
  output [6:0] seg_out
);
  reg [6:0] seg_patterns [7:0];
  
  integer i;
  initial begin
    for (i = 0; i <= 8; i = i + 1) begin
      case (i)
        0: seg_patterns[i] = 7'b1111110; // 0
        1: seg_patterns[i] = 7'b0110000; // 1
        2: seg_patterns[i] = 7'b1101101; // 2
        3: seg_patterns[i] = 7'b1111001; // 3
        default: seg_patterns[i] = 7'b1001111; // E for digits 4 to 9
      endcase
    end
  end
   
  assign seg_out = seg_patterns[inp];
  
endmodule