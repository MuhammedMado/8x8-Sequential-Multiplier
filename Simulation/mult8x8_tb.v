module mult8x8_tb;

    reg [7:0] dataa,datab;
    reg start,clk,reset_a;
    wire [15:0] product8x8_out;
    wire done_flag;

    mult8x8 u1 (dataa,datab,start,clk,reset_a,product8x8_out,done_flag);

    initial begin
        reset_a=1'b0;
        clk=1'b0;
        dataa=8'd17;
        datab=8'd100;
        start=1'b0;
        #10 reset_a=1'b0;
        #10 reset_a=1'b1;
        start=1'b1;
        #10 start=1'b0;
        
        #160;
        start=1'b1;
        #10 start=1'b0;
        dataa=8'd94;
        datab=8'd57;
        
            #160;
            start=1'b1;
            #10 start=1'b0;
            
            dataa=8'hff;
            datab=8'hff;
                
        #160;
        start=1'b1;
        #5 start=1'b0;
        #5 start=1'b1;      // If I gave start value 1 before the done flag be 1, product will be zero.
        #5 start=1'b0;
        
        dataa=8'd14;
        datab=8'd7;     
          #160;
                start=1'b1;
                #10 start=1'b0;
                dataa=8'd32;
                datab=8'd232;
        #160;
        start=1'b1; 
          // when i let start = 1, product will be zero.
        dataa=8'd26;
        datab=8'd100;
      end
    always begin
        #5 clk=~clk;
    end
    endmodule