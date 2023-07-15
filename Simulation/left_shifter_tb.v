module left_shifter_tb;
  // Inputs
  reg [7:0] inp;
  reg [1:0] shift_cntrl;

  // Outputs
  wire [15:0] shift_out;

  // Instantiate the module under test
  left_shifter dut (
    .inp(inp),
    .shift_cntrl(shift_cntrl),
    .shift_out(shift_out)
  );
  // Testbench stimulus
  initial begin
    inp = 8'b10101010;
    shift_cntrl = 2'b00; // No shift  
    #10;
    
    shift_cntrl = 2'b01; // 4-bit shift left
    #10;
    
    shift_cntrl = 2'b10; // 8-bit shift left
    #10;
    
    shift_cntrl = 2'b11; // No shift
    #10;
    
    $finish;
  end
endmodule