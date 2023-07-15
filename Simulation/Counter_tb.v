module Counter_tb;
  reg aclr_n;
  reg clk;
  wire [1:0] count_out;
  // Instantiate the Counter module
  Counter uut (
    .aclr_n(aclr_n),
    .clk(clk),
    .count_out(count_out)
  );
  // Clock generator
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end
  initial begin
    // Initialize inputs
    aclr_n = 1;
    #5 aclr_n = 0;
    #10 aclr_n = 1;
    #10 aclr_n = 0;
    #10 aclr_n = 1;
    #30;
    $finish;
  end
  always @(posedge clk) begin
    $display("count_out = %b", count_out);
  end
endmodule
