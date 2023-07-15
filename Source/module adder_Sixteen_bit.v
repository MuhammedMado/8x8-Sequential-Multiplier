module adder_Sixteen_bit(
  output [15:0] sum,
  output cout,
  input [15:0] dataa, datab
);
  wire [16:0] c;  
  full_3 ad_inst (      // first full adder generating
    .dataa(dataa[0]),
    .datab(datab[0]),
    .cin(0),
    .s(sum[0]),
    .cout(c[1])
  ); 
  genvar i;
  generate                  // generate 16-bit full adder
    for (i = 1; i < 16; i = i + 1) begin
      full_3 ad_inst (
        .dataa(dataa[i]),
        .datab(datab[i]),
        .cin(c[i]),
        .s(sum[i]),
        .cout(c[i+1])
      );
    end
  endgenerate 
  assign cout = c[16]; 
endmodule

module full_3(dataa, datab, cin, s, cout);    // full adder module
  input dataa, datab, cin;
  output s, cout;
  assign s = dataa ^ datab ^ cin;
  assign cout = (dataa & datab) | (datab & cin) | (cin & dataa);
endmodule
