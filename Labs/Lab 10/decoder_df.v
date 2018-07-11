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