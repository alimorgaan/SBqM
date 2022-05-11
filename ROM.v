module ROM (
    input [2:0] Pcount ,
    input [1:0] Tcount,
    output reg [4:0] Wtime 
);
    reg [4:0] rom [0:31];

integer i ;
    initial begin
        rom[0] =0 ;    rom[1] =0 ;   rom[2] =0 ;   rom[3] =0 ;
        rom[4] =0 ;    rom[5] =0 ;   rom[6] =0 ;   rom[7] =0 ;
        rom[8] =0 ;    rom[9] = 3;   rom[10] =6 ;  rom[11] =9 ; 
        rom[12] = 12 ; rom[13] =15 ; rom[14] =18 ;  rom[15] = 21;
        rom[16] = 0;   rom[17] = 3;  rom[18] =4 ;  rom[19] =6 ;
        rom[20] = 7 ;  rom[21] =9 ;  rom[22] =10 ; rom[23] = 12;
        rom[24] = 0;   rom[25] =3 ;  rom[26] = 4;  rom[27] =5 ; 
        rom[28] = 6;   rom[29] =7 ;  rom[30] = 8;  rom[31] = 9; 
    end

always @(*) begin
    Wtime = rom[{Tcount , Pcount}]; 
end 

endmodule