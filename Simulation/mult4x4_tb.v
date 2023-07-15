module mult4x4_tb;
  // Inputs
  reg [3:0] dataa;
  reg [3:0] datab; 
  // Outputs
  wire [7:0] product;
  // Instantiate the mult4x4 module
  mult4x4 dut (
    .dataa(dataa),
    .datab(datab),
    .product(product)
  );
  initial begin
    // Initialize inputs
    dataa = 4'b1010;
    datab = 4'b0110;
    #10;
    
    // Change cases
    dataa = 4'b1110;
    datab = 4'b0100;
    #10;
 
       dataa = 4'b0101;
       datab = 4'b0111;
       #10;
             
    // Finish simulation
    $finish;
  end
endmodule
