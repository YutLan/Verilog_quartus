/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////

//module sc_computer (resetn,clock,mem_clk,pc,inst,aluout,memout,imem_clk,dmem_clk,
//in_port0,in_port1,out_port0,out_port1,out_port2,hex0,hex1,hex2,hex3,hex4,hex5,mem_dataout,io_read_data);
module sc_computer (resetn,clock,mem_clk,pc,inst,aluout,memout,imem_clk,dmem_clk,
in_port0,in_port1,hex0,hex1,hex2,hex3,hex4,hex5);
   // module sc_computer(mem_clk,hex0,hex1,hex2,hex3,hex4,hex5);
    //input mem_clk;
	 //output [6:0] hex0,hex1,hex2,hex3,hex4,hex5;
	// reg [6:0] hex5;
    
   //output [31:0] out_port1,out_port0,out_port2;
   //output[31:0] mem_dataout,io_read_data;	
	
	reg[5:0] test;
   output resetn;
	reg resetn;
	input mem_clk;
   output clock;

   reg clock;
	

   initial
	begin
	    clock=0;
	end
	
	always @ (posedge mem_clk)
	begin 
	   test=test+1;
		if (test==5)
		    resetn<=1;
	   clock<=~clock;
	end  
	
	
	
	
	
	input [4:0] in_port1,in_port0;
   output [6:0] hex0,hex1,hex2,hex3,hex4,hex5;
   output [31:0] pc,inst,aluout,memout;
   output        imem_clk,dmem_clk;
  // output out_port1,out_port0,out_port2;
//	wire [31:0] out_port2;
	wire [31:0] mem_dataout,io_read_data,out_port1,out_port0,out_port2,data;
   wire          wmem; // all these "wire"s are used to connect or interface the cpu,dmem,imem and so on.
   
   sc_cpu cpu (clock,resetn,inst,memout,pc,wmem,aluout,data);          // CPU module.
   sc_instmem  imem (pc,inst,clock,mem_clk,imem_clk);                  // instruction memory.
  //sc_datamem  dmem (aluout,data,memout,wmem,clock,mem_clk,dmem_clk ); // data memory.
	sc_datamem  dmem (aluout,data,memout,wmem,clock,mem_clk,dmem_clk,resetn,out_port0,out_port1,out_port2,in_port0,in_port1,mem_dataout,io_read_data); // data memory.
 
	
  /* reg[3:0] test2;
	always @(posedge mem_clk)
	begin
	  test2=4'b1101;

	end
*/	
	sevenseg sevenseg0(out_port2[7:4],hex1);
	sevenseg sevenseg1(out_port2[3:0],hex0);
	//sevenseg sevenseg2(out_port1[7:4],hex2);
	//sevenseg sevenseg3(out_port1[3:0],hex3);
	//sevenseg sevenseg4(out_port0[7:4],hex4);
    //sevenseg sevenseg5(out_port0[3:0],hex5);
	sevenseg sevenseg2(in_port1[4:4],hex3);
	sevenseg sevenseg3(in_port1[3:0],hex2);
	sevenseg sevenseg4(in_port0[4:4],hex5);
   sevenseg sevenseg5(in_port0[3:0],hex4);
/*	initial
	begin
	
	hex5=7'b101_1111;
	end */

endmodule



