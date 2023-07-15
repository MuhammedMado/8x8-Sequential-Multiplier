module mux_tb;
  // Inputs
  reg [3:0] mux_in_a;
  reg [3:0] mux_in_b;
  reg mux_sel;
  // Outputs
  wire [3:0] mux_out;
  // Instantiate the mux module
  mux dut (
    .mux_in_a(mux_in_a),
    .mux_in_b(mux_in_b),
    .mux_sel(mux_sel),
    .mux_out(mux_out)
  );

  initial begin
    // Initialize inputs
    mux_in_a = 4'b1010;
    mux_in_b = 4'b0110;
    mux_sel = 0;
    #10;
    
      mux_in_a = 4'b1100;
      mux_in_b = 4'b0001;
      mux_sel = 1;
      #10;

    $finish;
  end

endmodule
