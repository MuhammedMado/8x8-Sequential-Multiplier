module tb_adder_Sixteen_bit;

  reg [15:0] dataa;
  reg [15:0] datab;
  wire [15:0] sum;
  wire cout;

  adder_Sixteen_bit dut (
    .sum(sum),
    .cout(cout),
    .dataa(dataa),
    .datab(datab)
  );

  initial begin
    #10;
    dataa = 16'd10;
    datab = 16'd6;
    #10;

    dataa = 16'd2;
    datab = 16'd4;
    #10;
    
     dataa = 16'd500;
     datab = 16'd256;
     #10;
    
    $finish;
  end

endmodule
