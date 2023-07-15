module mult8x8(
    input [7:0] dataa,datab,
    input start,clk,reset_a,
    output [15:0] product8x8_out,
    output wire done_flag,
    output seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g
);

wire [1:0] sel,shift,count;
wire [2:0] state_out;
wire clk_ena,sclr_n;

wire [3:0] aout,bout;

wire [7:0] product;

wire [15:0] shift_out,sum;
wire cout;

mux u1 (dataa[3:0],dataa[7:4],sel[1],aout);
mux u2 (datab[3:0],datab[7:4],sel[0],bout);

mult4x4 u3 (aout,bout,product);

left_shifter u4 (product,shift,shift_out);

FA_generic  #(.N(16)) u5 (shift_out,product8x8_out,1'b0,sum,cout);

Sync16BitRegister u6 (sum,sclr_n,clk_ena,clk,product8x8_out);

FSM1 u7 (clk,reset_a,start,count,sel,shift,state_out,done_flag,clk_ena,sclr_n);

Counter u8 ((!start),clk,count);
seven_segment_encoder u9 (state_out,{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g});

endmodule