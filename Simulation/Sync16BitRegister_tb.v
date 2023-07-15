module Sync16BitRegister_tb;
  reg [15:0] datain;
  reg sclr_n;
  reg clk_ena;
  reg clk;
  wire [15:0] reg_out;
  // Instantiate the Sync16BitRegister module
  Sync16BitRegister uut (
    .datain(datain),
    .sclr_n(sclr_n),
    .clk_ena(clk_ena),
    .clk(clk),
    .reg_out(reg_out)
  );
  always begin     // Clock generator
    clk = 0;
    #5;
    clk = 1;
    #5;
  end
  initial begin        // Initialize inputs
    sclr_n = 1;
    clk_ena = 0;
    datain = 16'h1234;
    
    #15 sclr_n = 0;     // Apply reset for a few clock cycles
    
    #5 sclr_n = 1;        // Release reset and enable clock
    #5 clk_ena = 1;

    // Load new input data
    #5 datain = 16'hABCD;

    #20 clk_ena = 0;      // Disable clock

    // Load new input data (should not affect output since clk_ena = 0)
    #5 datain = 16'h5678;

    #5 clk_ena = 1;     // Enable clock again
   
    #15;
    $finish;
  end
endmodule
