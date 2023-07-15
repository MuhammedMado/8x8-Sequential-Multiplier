module seven_segment_encoder_tb;
  
  reg [2:0] inp;
  wire [6:0] seg_out;
  
  // Instantiate the module under test
  seven_segment_encoder dut(
    .inp(inp),
    .seg_out(seg_out)
  );
  
  // Stimulus generation
  initial begin
    // Test each input value from 0 to 7
    for (inp = 0; inp < 8; inp = inp + 1) begin
      #10; // Wait for some time
      
    end
    
    // End simulation
    $finish;
  end
  
endmodule
