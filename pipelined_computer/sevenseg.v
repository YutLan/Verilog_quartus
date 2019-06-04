module sevenseg ( data, ledsegments);
input [3:0] data;
output ledsegments;
reg [6:0] ledsegments;
always @ (*)
case(data)
// gfe_dcba // 7 段 LED 数码管的位段编号
// 654_3210 // DE2 板上的信号位编号
4'h0: ledsegments = 7'b100_0000; // DE2C 板上的数码管为共阳极接法。
4'h1: ledsegments = 7'b111_1001;
4'h2: ledsegments = 7'b010_0100;
4'h3: ledsegments = 7'b011_0000;
4'h4: ledsegments = 7'b001_1001;
4'h5: ledsegments = 7'b001_0010;
4'h6: ledsegments = 7'b000_0010;
4'h7: ledsegments = 7'b111_1000;
4'h8: ledsegments = 7'b000_0000;
4'h9: ledsegments = 7'b001_0000;
4'hA: ledsegments = 7'b000_1000;
4'hB: ledsegments = 7'b000_0011;
4'hC: ledsegments = 7'b100_0110;
4'hD: ledsegments = 7'b010_0001;
4'hE: ledsegments = 7'b000_0110;
4'hF: ledsegments = 7'b000_1110;
default: ledsegments = 7'b111_1111; // 其它值时全灭。
endcase
endmodule