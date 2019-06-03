module sc_cu (op, func, z, wmem, wreg, regrt, m2reg, aluc, shift,
              aluimm, pcsource, jal, sext);
   input  [5:0] op,func;
   input        z;
   output       wreg,regrt,jal,m2reg,shift,aluimm,sext,wmem;
   output [3:0] aluc;
   output [1:0] pcsource;
   wire r_type = ~|op;
   //100000
   wire i_add = r_type & func[5] & ~func[4] & ~func[3] &
                ~func[2] & ~func[1] & ~func[0];      
   
   //100010
   wire i_sub = r_type & func[5] & ~func[4] & ~func[3] &
                ~func[2] &  func[1] & ~func[0];          
      
   //  please complete the deleted code.
   
   //100100
   wire i_and =r_type & func[5] & ~func[4] & ~func[3] &
              func[2] & ~func[1] & ~func[0];

   //100101           
   wire i_or  = func[5]& ~func[4]& ~func[3]& func[2]& ~func[1]& func[0]& r_type;
   //100110
   wire i_xor = func[5]& ~func[4]& ~func[3]& func[2]& func[1]& ~func[0]& r_type;
   //000000   
   wire i_sll = ~func[5]& ~func[4]& ~func[3]& ~func[2]& ~func[1]& ~func[0]& r_type;
   //000010
   wire i_srl = ~func[5]& ~func[4]& ~func[3]& ~func[2]& func[1]& ~func[0]& r_type;
   //000011
   wire i_sra = ~func[5]& ~func[4]& ~func[3]& ~func[2]& func[1]& func[0]& r_type;
   //001000
   wire i_jr  = ~func[5]& ~func[4]& func[3]& ~func[2]& ~func[1]& ~func[0]& r_type;
                
   wire i_addi = ~op[5] & ~op[4] &  op[3] & ~op[2] & ~op[1] & ~op[0]; //001000
   wire i_andi = ~op[5] & ~op[4] &  op[3] &  op[2] & ~op[1] & ~op[0]; //001100
   //001101
   wire i_ori  =  ~op[5]& ~op[4]& op[3]& op[2]& ~op[1]& op[0] ;
   //001110       
   wire i_xori =  ~op[5]& ~op[4]& op[3]& op[2]& op[1]& ~op[0] ;
   //100011 
   wire i_lw   = op[5]& ~op[4]& ~op[3]& ~op[2]& op[1]& op[0] ;
   //101011  
   wire i_sw   =op[5]& ~op[4]& op[3]& ~op[2]& op[1]& op[0] ; 
   //000100
   wire i_beq  = ~op[5]& ~op[4]& ~op[3]& op[2]& ~op[1]& ~op[0] ;
   //000101
   wire i_bne  = ~op[5]& ~op[4]& ~op[3]& op[2]& ~op[1]& op[0] ;
   //001111
   wire i_lui  = ~op[5]& ~op[4]& op[3]& op[2]& op[1]& op[0] ;
   //000010
   wire i_j    =~op[5]& ~op[4]& ~op[3]& ~op[2]& op[1]& ~op[0] ; 
   //000011
   wire i_jal  = ~op[5]& ~op[4]& ~op[3]& ~op[2]& op[1]& op[0] ;
   
  
   assign pcsource[1] = i_jr | i_j | i_jal;
   assign pcsource[0] = ( i_beq & z ) | (i_bne & ~z) | i_j | i_jal ;
   
   assign wreg = i_add | i_sub | i_and | i_or   | i_xor  |
                 i_sll | i_srl | i_sra | i_addi | i_andi |
                 i_ori | i_xori | i_lw | i_lui  | i_jal;
   
   assign aluc[3] =  i_sra;    // complete by yourself.
   assign aluc[2] =  i_ori | i_sub | i_or | i_srl | i_sra;
   assign aluc[1] =  i_sll  | i_xor | i_srl | i_sra| i_xori;
   assign aluc[0] =  i_and | i_or | i_srl | i_sra| i_sll  |i_andi| i_ori;

   assign shift   = i_sll | i_srl | i_sra ;

   assign aluimm  =  i_addi|i_andi|i_ori|i_xori|i_lw|i_sw| i_lui;//7
   assign sext    =  i_andi|i_lw|i_sw|i_beq|i_bne|i_lui; //6 不知道要不要lui
   assign wmem    =  i_sw; 
   assign m2reg   =  i_lw;
   assign regrt   = i_addi|i_andi|i_ori|i_xori|i_lw|i_lui;//6
   assign jal     =  i_jal;

endmodule