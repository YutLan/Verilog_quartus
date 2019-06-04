module pipepc( npc,wpcir,clock,resetn,pc );
input wire [31:0] npc;
input wpcir,clock,resetn;
output reg[31:0] pc;

always @(posedge clock or negedge resetn) 
begin
	if(~resetn) begin
		pc <= 0;
	end else 
	if(wpcir==1) begin
		pc <= npc ;
	end 
end

endmodule