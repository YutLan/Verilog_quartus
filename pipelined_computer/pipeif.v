module pipeif (
    pcsource,pc,bpc,da,jpc,npc,pc4,ins,mem_clock 
);
input wire[1:0] pcsource;
input wire[31:0] pc,bpc,da,jpc;
input wire mem_clock;
output wire[31:0] pc4,ins,npc;

wire[31:0] instmp;

lpm_rom_irom rom(pc[7:2],mem_clock,instmp);

assign pc4=pc+32'h4;
assign ins=pcsource[0]?32'h0:instmp;



mux4x32 newpc(pc4,bpc,da,jpc,pcsource,npc);



endmodule