module D_FF ( output reg Q, Qn, input ck, rst, D );
 always @ ( posedge ck, posedge rst )
  if ( rst != 0 )
   begin
     Q <= 1'b0;
     Qn <= 1'b1;
   end
  else
   begin
     Q <= D;
     Qn <= ~D;
   end
endmodule

module Nibble_Reg(data_out,data_in,clk,out_en);
  input  [3:0] data_in;
  input        clk,out_en;
  output [3:0] data_out;
  
  // wires between flip-flops and tri-state gates
  wire   [3:0] dff_out;
  wire rst;
  wire [3:0] Qn;
  assign rst = 0;
  
  // instantiate tri-state gates to do output enable
  bufif0 tri3(data_out[3],dff_out[3],out_en);
  bufif0 tri2(data_out[2],dff_out[2],out_en);
  bufif0 tri1(data_out[1],dff_out[1],out_en); // tri1 is a gate type
  bufif0 tri0(data_out[0],dff_out[0],out_en); // tri0 is a gate type
  
  
  //instantiate D flip-flops here
  D_FF Reg_Bit_3(diff_out[3], Qn[0], clk, rst, data_in[3]);
  D_FF Reg_Bit_2(diff_out[2], Qn[1], clk, rst, data_in[2]);
  D_FF Reg_Bit_1(diff_out[1], Qn[2], clk, rst, data_in[1]);
  D_FF Reg_Bit_0(diff_out[0], Qn[3], clk, rst, data_in[0]);
endmodule

module decoder_df ( output [3:0] D, input [1:0] A, input enable );
    assign D[0] = A[1] & A[0] & enable;
    assign D[1] = A[1] & ~A[0] & enable;
    assign D[2] = ~A[1] & A[0] & enable;
    assign D[3] = ~A[1] & ~A[0] & enable;
endmodule

module Register_File(data_out,data_in,read_add,read_en,write_add,write_en);
  input  [3:0] data_in;            // data to write
  input  [1:0] read_add,write_add; // read address and write address
  input        read_en,write_en;   // read and write enable
  output [3:0] data_out;           // data to read
  
  wire   [3:0] read_sel,write_sel;
  
  //instantiate registers here
  decoder_df Dec_Read(read_sel,read_en,read_add);
  decoder_df Dec_Write(write_sel,write_en,write_add);
  
  
  //instantiate registers here
  Nibble_Reg Reg_0(data_out,data_in,write_sel[0],read_sel[0]);
  Nibble_Reg Reg_1(data_out,data_in,write_sel[1],read_sel[1]);
  Nibble_Reg Reg_2(data_out,data_in,write_sel[2],read_sel]2]);
  Nibble_Reg Reg_3(data_out,data_in,write_sel[3],read_sel[3]);
endmodule
  
     
